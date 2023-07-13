import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/data.dart';
import '../../widgets/custom_common_button.dart';

class BreakingNewsSection extends StatefulWidget {
  final BuildContext context;
  const BreakingNewsSection({super.key, required this.context});

  @override
  State<BreakingNewsSection> createState() => _BreakingNewsSectionState();
}

class _BreakingNewsSectionState extends State<BreakingNewsSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        Map datar = data[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.all(7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Theme.of(context).primaryColorDark,
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 160,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            datar['posts'],
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 35,
                  //   backgroundImage: AssetImage(datar['posts']),
                  // ),
                  Text(
                    "Breaking News Dummy Text\n text For dummy",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomCommonButton(
                    buttonName: "Adanient",
                    backGroundColor: Constants.lightBG,
                    fontColor: Constants.darkPrimary,
                    height: 20,
                    width: 100,
                    radius: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'oct 01, 2019 - oct 21, 2019',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
