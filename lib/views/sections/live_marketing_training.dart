import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/data.dart';

class LiveMarketTrainingList extends StatefulWidget {
  final BuildContext context;
  const LiveMarketTrainingList({super.key, required this.context});

  @override
  State<LiveMarketTrainingList> createState() => _LiveMarketTrainingListState();
}

class _LiveMarketTrainingListState extends State<LiveMarketTrainingList> {
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
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: 80,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        datar['posts'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/youtube.png",
                    scale: 10,
                  ),
                ),
                Text(
                  "Live Marketing Traing Videos",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
