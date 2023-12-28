import 'package:first_app/view/trending_news.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
        appBar: AppBar(
          title:Text("News", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:30,

          ),),
          leading: IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/category_icon.png")
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreen(),
              TrendingNews(),

            ],
          ),
        ),
      ),
    );
  }
}
