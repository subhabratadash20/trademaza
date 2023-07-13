import 'package:flutter/material.dart';

import '../../utils/data.dart';

class TopGridView extends StatefulWidget {
  const TopGridView({super.key});

  @override
  _TopGridViewState createState() => _TopGridViewState();
}

class _TopGridViewState extends State<TopGridView> {
  List<String> courseName = [
    "Equity",
    "Nifty/Bank Nifty",
    "Commodity",
    "Currency"
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      // scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),

      itemBuilder: (BuildContext context, int index) {
        Map story = data[index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: 160.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.lightBlue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(story['story']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      courseName[index],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 3.5,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
