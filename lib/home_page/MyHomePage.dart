import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/home_page/article.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> category = new List<CategoryModel>();
  List<NewsModel> allNews = new List<NewsModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategoryModel();
    getNews();
  }

  getNews() async {
    News newsClass = new News();
    await newsClass.getNews();
    allNews = newsClass.news;
    print(allNews);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      ///Category
                      Container(
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: category.length,
                            itemBuilder: (context, index) {
                              return CategoryTiles(
                                  imageUrl: category[index].imageUrl,
                                  categoryName: category[index].categoryName);
                            }),
                      ),

                      /// Blogs
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: allNews.length,
                            itemBuilder: (context, index) {
                              return BlogTiles(
                                imageUrl: allNews[index].urlToImage,
                                title: allNews[index].title,
                                description: allNews[index].description,
                                url: allNews[index].url,

                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CategoryTiles extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTiles({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              height: 60,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTiles extends StatelessWidget {
  final String imageUrl, title, description,url;

  BlogTiles(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(url);

        Navigator.push(context, MaterialPageRoute(builder: (context)=>Articles(blogUrl: url)));
      },
      child: Container(
        margin :EdgeInsets.only(bottom: 10) ,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
                child: Image.network(imageUrl)),
            SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 18),),
            SizedBox(height: 8,),
            Text(description, style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
