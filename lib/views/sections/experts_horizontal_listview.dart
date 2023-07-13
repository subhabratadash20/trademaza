import 'package:flutter/material.dart';
import 'package:trademaza/utils/constants.dart';
import 'package:trademaza/utils/data.dart';
import 'package:trademaza/widgets/custom_common_button.dart';

class ExpertsList extends StatefulWidget {
  const ExpertsList({super.key});

  @override
  State<ExpertsList> createState() => _ExpertsListState();
}

class _ExpertsListState extends State<ExpertsList> {
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
          color: Constants.lightBG,
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 120,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(datar['dp']),
                  ),
                  Text(
                    datar['name'],
                    style: TextStyle(
                        color: Constants.darkBG, fontWeight: FontWeight.bold),
                  ),
                  CustomCommonButton(
                    buttonName: "View",
                    backGroundColor: Constants.darkPrimary,
                    fontColor: Constants.lightBG,
                    height: 20,
                    width: 50,
                    radius: 5,
                  )
                ]),
          ),
        );
      },
    );
  }
}
