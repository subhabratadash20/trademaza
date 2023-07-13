import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/exploregrids.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 3),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Ionicons.chevron_down,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: ExploreGrids(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Explore',
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
