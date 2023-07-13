import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:trademaza/widgets/custom_common_button.dart';

import '../../utils/data.dart';

class PostsListScreen extends StatefulWidget {
  final int? length;
  final bool isIntaction;
  PostsListScreen({super.key, this.length, this.isIntaction = true});

  @override
  _PostsListScreenState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.length ?? 4,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        Map datar = data[index];
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColorDark),
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage(datar['saved']),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.8),
                        ]),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  datar['dp'],
                                ),
                                radius: 10,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                datar['name'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              if (widget.isIntaction) ...[
                                Text(
                                  Random().nextInt(2000).toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'likes',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Ionicons.heart,
                                  size: 15,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.share,
                                  size: 15,
                                  color: Colors.white,
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Caption "fbwekbobwrfjbd,mfn kja fk sk cfkkad dcfk dakb fk akhb cfkbkad v"',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,

                                  color: Colors.white,
                                  //
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'oct 01, 2019 - oct 21, 2019',
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: CustomCommonButton(
                  height: 35,
                  buttonName: "Learn From The Experts  ->",
                  width: MediaQuery.sizeOf(context).width * .8,
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        );
      },
    );
  }
}
