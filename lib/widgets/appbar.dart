import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

AppBar custoAppBar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    // backgroundColor: Theme.of(context).,
    toolbarHeight: 65,
    elevation: 0.0,
    // leading: const Padding(
    //   padding: EdgeInsets.only(top: 10.0),
    //   child: Icon(Icons.subject),
    // ),
    title: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => const Profile(),
                    //   ),
                    // );
                  },
                  child: SizedBox(
                      width: 35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          "assets/images/OIG.jpg",
                          fit: BoxFit.cover,
                        ),
                      ))),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => const Profile(),
                  //   ),
                  // );
                },
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/story/cm1.jpeg'),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Container(
                  height: 35.0,
                  // width: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        SizedBox(width: 3),
                        Icon(
                          Iconsax.search_normal,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Search...Experts or Courses',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 17.0,
                  ),
                  child: Icon(
                    Icons.share,
                    size: 25,
                    //  color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: Text(
              "Hello User",
              style: TextStyle(fontSize: 13),
            ),
          )
        ],
      ),
    ),
  );
}
