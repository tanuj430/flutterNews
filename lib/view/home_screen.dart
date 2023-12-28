import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/models/news_Headlines_Model.dart';
import 'package:first_app/news_repository.dart';
import 'package:first_app/view/reading_web_page.dart';
import 'package:first_app/view/trending_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<newsHeadlinesModel> apiData;
  @override
  void initState() {
    // TODO: implement initState
    apiData = newsRepository(
            endPoint:
                "https://newsapi.org/v2/top-headlines?country=us&apiKey=cb65c37d80154b86ba18cc318626936e")
        .getData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: Image.asset(
        //       "assets/images/category_icon.png",
        //       width: 30,
        //       height: 30,
        //     ),
        //   ),
        //   title: Text(
        //     "News",
        //     style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        //   ),
        // ),
        // body:
        Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          child: Row(
            children: [
              Text(
                'Breaking News',
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
        ),
        FutureBuilder(
            future: apiData,
            builder: (BuildContext context, snapshot) {
              // if statemetn #######################################################################
              if (snapshot.hasData && !snapshot.hasError) {
                return CarouselSlider.builder(
                    itemCount: snapshot.data!.articles!.length,
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      height: 400,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      var pre = snapshot.data!.articles![index];
                      if (pre.urlToImage != null &&
                          pre.title != null &&
                          pre.description != null &&
                          pre.url != null &&
                          pre.source!= null &&
                          pre.publishedAt !=null &&
                          pre.content !=null &&
                          pre.toString() != "file:///null" ) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ReadingWeb(
                                          url: snapshot.data!.articles![index]
                                              .url
                                              .toString()),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.blue,
                            ),
                            child: Stack(
                              children: [
                                // it is firs childre where we have put the image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  // Image of carosel slider is here---------------------------------
                                  child: Image.network(
                                    snapshot.data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                    height: 500,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                // this is cotainer over the image the show title------------------
                                Align(
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        snapshot.data!.articles![index].title
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    width: width * 1,
                                  ),
                                  alignment: Alignment.bottomCenter,
                                ),
                              ],
                            ),
                          ),
                        );
                      }else{
                        return Container();
                      }
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
        SizedBox(
          height: 20,
        ),
        // this is trending news code ############################################
      ],
    );
  }
}
