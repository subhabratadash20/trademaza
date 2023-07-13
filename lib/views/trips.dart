import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';
import 'package:trademaza/utils/constants.dart';

class Trips extends StatefulWidget {
  const Trips({super.key});

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                      indicatorColor: const Color(0xfff3f4f9),
                      indicator: PointTabIndicator(
                        position: PointTabIndicatorPosition.bottom,
                        insets: const EdgeInsets.only(bottom: 3),
                        color: Constants.defaultBottonColor,
                      ),
                      indicatorWeight: 1.0,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      tabs: const <Widget>[
                        Tab(
                          child: Text(
                            'App Feed',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Forum',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const <Widget>[
                        SizedBox(),
                        SizedBox(),

                        // PostsListScreen(),
                        // FavoriteTrips(),
                        // Whishlist(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Trips',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
