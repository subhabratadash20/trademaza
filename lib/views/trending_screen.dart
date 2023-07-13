import 'package:flutter/material.dart';
import 'package:trademaza/views/sections/post_lists.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: PostsListScreen(
        length: 5,
      )),
    );
  }
}
