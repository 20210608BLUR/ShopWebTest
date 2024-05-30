using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using ShopWebsite.Areas.BackEnd.Interface;
using ShopWebsite.Areas.BackEnd.Models;
using ShopWebsite.Areas.BackEnd.ViewModel.NewsViewModel;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
using AngleSharp;
using AngleSharp.Dom;
using System.Linq;
using AngleSharp.Html.Parser;
using System.Net.Http;
using System.Net;
using Microsoft.Data.SqlClient;

namespace ShopWebsite.Areas.BackEnd.Repository
{
    public class NewsRepository : INewsRepository
    {

        private ShopWebsiteContext _context;
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly HttpClient _httpClient;

        public NewsRepository(ShopWebsiteContext context, IWebHostEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
            _httpClient = new HttpClient();
        }


        /// <summary>
        /// 取得列表
        /// </summary>
        /// <returns></returns>
        public List<NewsIndexViewModel> GetList()
        {
            int itemPerpage = 10;

            List<NewsIndexViewModel> viewModel = _context.News
                                            .Select(n => new NewsIndexViewModel
                                            {
                                                NewsNum = n.NewsNum,
                                                NewsTitle = n.NewsTitle,
                                                NewsDescription = n.NewsDescription,
                                                NewsImg1 = n.NewsImg1,
                                                NewsPutTime = n.NewsPutTime,
                                                CreateTime = n.CreateTime,
                                                EditTime = n.EditTime,
                                                NewsOffTime = n.NewsOffTime,
                                                NewsPublish = n.NewsPublish

                                            }).ToList();
            // 計算總頁數
            int totalPageS = (int)Math.Ceiling((double)viewModel.Count() / itemPerpage);

            // 根據 Page 參數進行分頁
            

            return viewModel;
        }


        public NewsCreateViewModel Create()
        {
            NewsCreateViewModel viewModel = new NewsCreateViewModel();
            return viewModel;
        }


        public void Create(NewsCreateViewModel newsViewModel, long AdminNum)
        {

            News news = new News()
            {
                NewsClass = newsViewModel.NewsClass,
                NewsTitle = newsViewModel.NewsTitle,
                NewsDescription = newsViewModel.NewsDescription,
                NewsContxt = newsViewModel.NewsContxt,
                NewsImg1 = newsViewModel.NewsImg1.FileName,
                NewsPublish = newsViewModel.NewsPublish,
                NewsPutTime = newsViewModel.NewsPutTime,
                NewsOffTime = newsViewModel.NewsOffTime,
                Creator = AdminNum,
                CreateTime = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")),
                Tag = newsViewModel.Tag
            };
            _context.Add(news);


            _context.SaveChanges();
        }



        public NewsEditViewModel Edit(long? id)
        {
            //進入DB搜尋資料
            NewsEditViewModel newsViewModel = (
                from news in _context.News
                where news.NewsNum == id
                select new NewsEditViewModel
                {
                    NewsNum = news.NewsNum,
                    NewsTitle = news.NewsTitle,
                    NewsClass = news.NewsClass,
                    NewsDescription = news.NewsDescription,
                    NewsContxt = news.NewsContxt,
                    NewsPublish = news.NewsPublish,
                    NewsPutTime = news.NewsPutTime,
                    NewsOffTime = news.NewsOffTime,
                    NewsImg1 = new FormFile(new MemoryStream(), 0, 0, news.NewsImg1.ToString(), news.NewsImg1.ToString()),
                    Tag = news.Tag
                }
            ).FirstOrDefault()!;

            return newsViewModel;
        }


        public void Edit(NewsEditViewModel newsViewModel, long AdminNum)
        {
            News news = _context.News.Where(x => x.NewsNum == newsViewModel.NewsNum).FirstOrDefault()!;

            //將資料寫入db
            news.NewsTitle = newsViewModel.NewsTitle;
            news.NewsClass = newsViewModel.NewsClass;
            news.NewsDescription = newsViewModel.NewsDescription;
            news.NewsContxt = newsViewModel.NewsContxt;
            news.NewsPublish = newsViewModel.NewsPublish;
            news.NewsPutTime = newsViewModel.NewsPutTime;
            news.NewsOffTime = newsViewModel.NewsOffTime;
            news.EditTime = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            news.Editor = AdminNum;

            if (newsViewModel.NewsImg1 != null)
            {
                news.NewsImg1 = newsViewModel.NewsImg1.FileName;
            }

            _context.Update(news);
            _context.SaveChanges();
        }       


        public string Delete(long? id)
        {
            var news = _context.News
               .FirstOrDefault(m => m.NewsNum == id);

            string result = JsonConvert.SerializeObject(news);

            return result;
        }


        public void DeleteConfirmed(long? id, string path)
        {
            var news = _context.News.Find(id);
            if (news != null)
            {
                _context.News.Remove(news);
            }

            _context.SaveChanges();

            //取得該篇文章的圖片並刪除
            var direPath = Path.Combine(path, "uploads", "News");
            var filePath = Path.Combine(direPath, news.NewsImg1);
            System.IO.File.Delete(filePath);
        }


        public void SaveFile(IFormFile file, string path)
        {
            var direPath = Path.Combine(path, "uploads", "News");
            if (!Directory.Exists(direPath))
            {
                Directory.CreateDirectory(direPath);
            }

            // 先將圖片儲存在記憶體內
            using (MemoryStream memoryStream = new MemoryStream())
            {
                file.CopyTo(memoryStream);

                // 讀取圖片檔
                using (var originalImage = Image.FromStream(memoryStream))
                {
                    int targetWidth = 370;
                    int targetHeight = 280;

                    double aspectRatio = (double)originalImage.Width / originalImage.Height;

                    // 建立圖片
                    using (var thumbnail = new Bitmap(targetWidth, targetHeight))
                    using (var graphics = Graphics.FromImage(thumbnail))
                    {
                        graphics.CompositingQuality = CompositingQuality.HighQuality;
                        graphics.SmoothingMode = SmoothingMode.HighQuality;
                        graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                        graphics.DrawImage(originalImage, 0, 0, targetWidth, targetHeight);

                        // 儲存圖片到路徑
                        var thumbnailFilePath = Path.Combine(direPath, file.FileName);
                        thumbnail.Save(thumbnailFilePath, ImageFormat.Jpeg);
                    }
                }
            }
        }


        public List<SelectListItem> GetNewsClasseList()
        {
            return _context.NewsClasses
                           .Where(g => g.NewsClassPublish == true)
                           .Select(g => new SelectListItem { Text = g.NewsClassName, Value = g.NewsClassNum.ToString() })
                           .ToList();
        }

        /// <summary>
        /// 爬蟲抓取資料
        /// </summary>
        /// <returns></returns>
        public void GetMenuByWeb()
        {  
            var config = AngleSharp.Configuration.Default.WithDefaultLoader();

            // 根據配置建立出我們的 Browser 
            var browser = BrowsingContext.New(config);

            // 這邊用的型別是 AngleSharp 提供的 AngleSharp.Dom.Url
            var url = new Url("https://technews.tw/category/semiconductor/");

            // 使用 OpenAsync 來打開網頁抓回內容
            var document = browser.OpenAsync(url).Result;

            // 抓回第一頁        
            var newsPage = ParseNews(document);            

            // 抓回第二三頁  
            int currentPage = 2;
            int totalPage = 3;
            List<News> newsPages = new List<News>();
            List<News> newsPagesTwo = new List<News>();

            while (currentPage <= totalPage)
            {
                string urls = $"{url}page/{currentPage}/";

                var documents = browser.OpenAsync(urls).Result;

                if(documents != null)
                {
                    newsPages = ParseNews(documents);

                    newsPagesTwo.AddRange(newsPages);

                    currentPage++;
                }
                else
                {
                    break;
                }
            }            

            _context.SaveChanges();
        }

        // 轉 WEB 資料
        public List<News> ParseNews(IDocument document)
        {
            var config = AngleSharp.Configuration.Default.WithDefaultLoader();

            // 根據配置建立出我們的 Browser 
            var browser = BrowsingContext.New(config);

            var wNews = document.QuerySelectorAll(".content");

            //var contxtUrlt = new Url("https://technews.tw/");
            //var contxtUrlf = new Url("https://finance.technews.tw/");
            //string finance, contxt, newContextUrlt, newContextUrlf;            
            //List<News> newsPages = new List<News>();
            //List<string> contxtList = new List<string>();

            //foreach (var w in wNews)
            //{
            //    finance = w.QuerySelector("div > header > table > tbody > tr:nth-child(1) > td > h1 > a").GetAttribute("href").ToString().Substring(8, 7);

            //    if (finance != "finance")
            //    {
            //        contxt = w.QuerySelector("div > header > table > tbody > tr:nth-child(1) > td > h1 > a").GetAttribute("href").ToString().Substring(20);
            //        newContextUrlt = $"{contxtUrlt}{contxt}";
            //        contxtList.Add(newContextUrlt);
            //    }
            //    else
            //    {
            //        contxt = w.QuerySelector("div > header > table > tbody > tr:nth-child(1) > td > h1 > a").GetAttribute("href").ToString().Substring(28);
            //        newContextUrlf = $"{contxtUrlf}{contxt}";
            //        contxtList.Add(newContextUrlf);
            //    }
            //}

            //foreach (var n in wNews)
            //{
            //    string link = n.QuerySelector("div > header > table > tbody > tr:nth-child(1) > td > h1 > a").GetAttribute("href");

            //    bool first = true;

            //    for (int i = 0; i <= contxtList.Count - 1; i++)
            //    {                    
            //        first = false;

            //        if (contxtList[i].Contains(link))
            //        {
            //            var itemUrl = new Url(link);
            //            var document1 = browser.OpenAsync(itemUrl).Result;
            //            string fileName = document1.QuerySelector(".entry-content >.bigg > img").GetAttribute("src").Remove(0, 60);

            //            if (document1.QuerySelector(".entry-content") != null)
            //            {                            
            //                News news = new News
            //                {

            //                    NewsTitle = n.QuerySelector(".maintitle").TextContent,
            //                    NewsContxt = document1.QuerySelector(".indent").TextContent,
            //                    NewsDescription = n.QuerySelector(".moreinf").TextContent.Substring(0, n.QuerySelector(".moreinf").TextContent.Length - 8),
            //                    NewsImg1 = fileName,
            //                    Tag = n.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(9)").TextContent.Replace("\n", "").Replace("\t", "").Trim(),
            //                    CreateTime = DateTime.Parse(n.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(5)").TextContent),
            //                    NewsPutTime = DateTime.Parse(n.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(5)").TextContent),
            //                    NewsPublish = true

            //                };                           
            //                newsPages.Add(news);                           
            //                TestSaveFile(document1.QuerySelector(".entry-content >.bigg > img").GetAttribute("src"));
            //            }
            //            else
            //            {
            //                News news = new News
            //                {
            //                    NewsTitle = n.QuerySelector(".maintitle").TextContent,
            //                    NewsContxt = "找不到頁面",
            //                    NewsDescription = n.QuerySelector(".moreinf").TextContent.Substring(0, n.QuerySelector(".moreinf").TextContent.Length - 8),
            //                    NewsImg1 = fileName,                               
            //                    CreateTime = DateTime.Parse(n.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(5)").TextContent),
            //                    NewsPutTime = DateTime.Parse(n.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(5)").TextContent),
            //                    NewsPublish = true
            //                };

            //               newsPages.Add(news);
            //               TestSaveFile(document1.QuerySelector(".entry-content >.bigg > img").GetAttribute("src"));

            //            }

            //        }                    
            //    }
            //}

            List<News> newsPagesSimple = new List<News>();

            foreach (var item in wNews)
            {                
                var link = item.QuerySelector("div > header > table > tbody > tr:nth-child(1) > td > h1 > a").GetAttribute("href");
                
                var itemUrl = new Url(link);
                
                var document1 = browser.OpenAsync(itemUrl).Result;                

                string fileName = document1.QuerySelector(".entry-content >.bigg > img").GetAttribute("src").Remove(0, 60);
                string p = item.QuerySelector(".maintitle").TextContent;
                
                // 比對文章是否重複
                List<string> newsTitle = _context.News.Select(n => n.NewsTitle).ToList();

                bool compare = false;
                for (int i = 0; i <= newsTitle.Count() - 1; i++)
                {               
                    if (newsTitle[i].Replace(" ","").Contains(p.Replace("\n","").Replace(" ","")))
                    {
                        compare = true;
                        break;
                    }     
                }

                if (compare)
                {
                    break;
                }
                else
                {
                    News news = new News
                    {
                        NewsTitle = item.QuerySelector(".maintitle").TextContent,
                        NewsContxt = document1.QuerySelector(".indent").InnerHtml,
                        //NewsContxt = document1.QuerySelector(".entry-content").InnerHtml,
                        NewsDescription = item.QuerySelector(".moreinf").TextContent.Substring(0, item.QuerySelector(".moreinf").TextContent.Length - 8),
                        NewsImg1 = fileName,
                        Tag = item.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(9)").TextContent.Replace("\n", "").Replace("\t", "").Trim(),
                        CreateTime = DateTime.Parse(item.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(5)").TextContent),
                        NewsPutTime = DateTime.Parse(item.QuerySelector("div > header > table > tbody > tr:nth-child(2) > td > span:nth-child(5)").TextContent),
                        NewsPublish = true
                    };

                    newsPagesSimple.Add(news);

                    using (ShopWebsiteContext dbContext = new ShopWebsiteContext())
                    {
                        var sortedNewsPages = newsPagesSimple.OrderBy(n => n.CreateTime).ToList();
                        _context.News.AddRange(sortedNewsPages);
                    }

                    // 存圖片
                    SaveFileFromWeb(document1.QuerySelector(".entry-content >.bigg > img").GetAttribute("src"), fileName);
                }
            };

            return newsPagesSimple;

            //return newsPages;
        }

        // 存網頁上的圖片至資料夾
        public void SaveFileFromWeb(string url, string imgLink)
        {
            HttpResponseMessage response = _httpClient.GetAsync(url).Result;

            // 獲取圖片的二進制數據
            byte[] imageData = response.Content.ReadAsByteArrayAsync().Result;

            // 將二進制數據保存到文件
            string fileName = $"{_hostingEnvironment.WebRootPath}/uploads/News/{imgLink}";

            File.WriteAllBytes(fileName, imageData);

        }

        //　測試 
        async public void Test()
        {
            List<string> newsTitle = _context.News.Select(n => n.NewsTitle).ToList();

            //using (HttpClient client = new HttpClient())
            //{
            //    string url = "https://img.technews.tw/wp-content/uploads/2023/01/12165304/shutterstock_540433684-624x390.jpg";
            //    HttpResponseMessage response = await client.GetAsync(url);
            //    string imgLink = url.Remove(0, 60);                

            //    // 獲取圖片的二進制數據
            //    byte[] imageData = await response.Content.ReadAsByteArrayAsync();

            //    // 將二進制數據保存到文件

            //    string fileName = $"{_hostingEnvironment.WebRootPath}/uploads/News/{imgLink}";
            //    File.WriteAllBytes(fileName, imageData);
            //};
        }
    }

}







