import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/helpers/constants.dart';
import 'package:news/helpers/widgets.dart';

import '../model/api/apis.dart';
import '../model/api/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final apiKey = 'b0e615eb9124484ebb9c8072842ec2a0';
  final networkHelper = NetworkHelper(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=b0e615eb9124484ebb9c8072842ec2a0'));

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat.yMMMMd();

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 25, bottom: 10, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  height: 45,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Icon(CupertinoIcons.bell),
                )
              ],
            ),
            const SizedBox(height: 15),
            const Text.rich(TextSpan(
                text: 'Welcome Back, ',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Chris',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: ' 👋🏾',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ])),
            const SizedBox(height: 7),
            const Text(
              'We’ve got some exciting new for you! 😉',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Gilroy',
                  fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Sections(
                      imageUrl: 'assets/images/gamepad.png',
                      containerUrl: 'assets/images/yellow.png',
                      section: 'Game',
                      updates: '+20 updates'),
                  Sections(
                      imageUrl: 'assets/images/ball.png',
                      containerUrl: 'assets/images/blue.png',
                      section: 'Sports',
                      updates: '+19 updates'),
                  Sections(
                      imageUrl: 'assets/images/burger.png',
                      containerUrl: 'assets/images/green.png',
                      section: 'Food',
                      updates: '+34 updates')
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(top: 7, bottom: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: kGrey),
              child: TabBar(
                indicatorColor: Colors.transparent,
                controller: _tabController,
                tabs: [
                  const Tab(
                    text: 'All',
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 15, left: 45, right: 45, bottom: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        'Popular',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kOrange,
                            fontFamily: 'Gilroy',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              Container(
                color: Colors.transparent,
                child: const Text(
                  "Hi I'm here",
                  style: TextStyle(color: Colors.black),
                ),
              ),

              // Widget for Tab 2
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '🔥 Popular',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(
                        children: const [
                          Icon(CupertinoIcons.rectangle_grid_1x2_fill),
                          SizedBox(width: 15),
                          Icon(
                            CupertinoIcons.rectangle_grid_2x2_fill,
                            color: kGrey,
                          ),
                          SizedBox(width: 15),
                          Icon(CupertinoIcons.slider_horizontal_3)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  FutureBuilder(
                    future: networkHelper.getData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        final newsData = snapshot.data;
                        final List<Article> articles = [];
                        for (var article in newsData['articles']) {
                          articles.add(Article.fromJson(article));
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (BuildContext context, int index) {
                              final article = articles[index];
                              return GestureDetector(
                                onTap: () {
                                  print('this was clicked');
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                article.author,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Gilroy',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(width: 15),
                                              Text(
                                                DateFormat.yMMMd().format(
                                                    DateTime.parse(
                                                        article.publishedAt)),
                                                style: const TextStyle(
                                                    fontSize: 14.0),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            article.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Divider(
                                            height: 10,
                                            thickness: 2,
                                            color: Colors.grey[300],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ]))
          ],
        ),
      )),
    );
  }
}
