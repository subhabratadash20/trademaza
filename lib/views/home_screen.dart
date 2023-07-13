import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:trademaza/views/sections/breaking_news_section.dart';
import 'package:trademaza/views/sections/carousal_slider.dart';
import 'package:trademaza/views/sections/experts_horizontal_listview.dart';
import 'package:trademaza/views/sections/live_marketing_training.dart';
import 'package:trademaza/views/sections/post_lists.dart';
import 'package:trademaza/views/sections/topsection.dart';
import 'package:trademaza/widgets/custom_common_button.dart';

import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabBar(
            // indicatorSize: ,
            controller: _tabController,
            padding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.symmetric(horizontal: 50),
            indicatorColor: const Color(0xfff3f4f9),
            indicator: PointTabIndicator(
              position: PointTabIndicatorPosition.bottom,
              insets: const EdgeInsets.only(bottom: 5),
              color: Constants.defaultBottonColor,
            ),
            indicatorWeight: 1.0,
            isScrollable: true,
            unselectedLabelColor: const Color.fromARGB(255, 129, 128, 128),
            labelColor: Theme.of(context).primaryColorLight,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  'Feed',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Forum',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .43,
                      child: const TopGridView(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCarousalSlider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Learn From Our Experts   ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3.0),
                          child: Icon(
                            Icons.book,
                            size: 18,
                            // color: Constants.darkAccent,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            ' View All',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Constants.defaultBottonColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),

                    // const SizedBox(height: 10.0),

                    const SizedBox(height: 170, child: ExpertsList()),

                    const SizedBox(height: 20.0),
                    // SavedItem(),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Trending  ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        Image.asset("assets/animations/fire.gif", height: 30),
                        Image.asset("assets/animations/fire.gif", height: 30),
                        Image.asset("assets/animations/fire.gif", height: 30),
                      ],
                    ),

                    PostsListScreen(
                      length: 1,
                      isIntaction: false,
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: CustomCommonButton(
                        onTap: () {
                          setState(() {
                            _tabController!.index = 1;
                          });
                        },
                        buttonName: "Explore ->",
                        fontSize: 20,
                        width: MediaQuery.of(context).size.width * .4,
                        height: 40,
                        radius: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Live Market Training   ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        Icon(
                          Iconsax.play_circle,
                          size: 18,
                          color: Constants.darkAccent,
                        ),
                        Text(
                          ' Live',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Constants.darkAccent,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {},
                          child: Text(
                            ' View All',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Constants.defaultBottonColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height * .19,
                        child: LiveMarketTrainingList(
                          context: context,
                        )),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: CustomCommonButton(
                        onTap: () {
                          setState(() {
                            _tabController!.index = 1;
                          });
                        },
                        buttonName: "Explore ->",
                        fontSize: 20,
                        width: MediaQuery.of(context).size.width * .4,
                        height: 40,
                        radius: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Breaking News',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {},
                          child: Text(
                            ' View All',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Constants.defaultBottonColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .25,
                      child: BreakingNewsSection(
                        context: context,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCarousalSlider(
                      height: 120,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width - 20,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/images/indian-flag-bricks--wallpaper-png_41618.jpg"))),
                    )
                  ],
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PostsListScreen(
                    // length: 2,
                    isIntaction: false,
                  ),
                ),

                // PostsListScreen(),
                // FavoriteTrips(),
                // Whishlist(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
