import 'package:first_app/models/news_Headlines_Model.dart';
import 'package:first_app/news_repository.dart';
import 'package:first_app/view/reading_web_page.dart';
import 'package:flutter/material.dart';

class TrendingNews extends StatefulWidget {
  const TrendingNews({super.key});

  @override
  State<TrendingNews> createState() => _TrendingNewsState();
}

class _TrendingNewsState extends State<TrendingNews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Trending News',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C4046),
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Text('Read More',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.lightBlueAccent)),
            ],
          ),
          FutureBuilder(
            future: newsRepository(
                    endPoint:
                        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=cb65c37d80154b86ba18cc318626936e")
                .getData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                // listview Builder #################################

                return Container(
                  height: MediaQuery.sizeOf(context).height,
                  child: ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        var pre = snapshot.data!.articles![index];
                        if (pre.urlToImage != null &&
                            pre.title != null &&
                            pre.description != null &&
                            pre.url != null &&
                            pre.source!= null &&
                        pre.publishedAt !=null &&
                        pre.content !=null &&
                            pre.toString() != "file:///null" ) {
                          return Material(
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      child: ClipRRect(
                                        child: Image.network(
                                          pre.urlToImage.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(40),
                                            topLeft: Radius.circular(40)),
                                      ),
                                      height: MediaQuery.sizeOf(context).height,
                                      width:
                                          MediaQuery.sizeOf(context).width * .4,
                                    ),
                                    // Navigator ####################################################################
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReadingWeb(
                                                url: pre.url!),
                                          ));
                                    },
                                  ),
                                  Expanded(
                                    child: Padding(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              pre.title.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // SizedBox(height: 4,),
                                          Flexible(
                                            child: Text(
                                              pre.description!.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
