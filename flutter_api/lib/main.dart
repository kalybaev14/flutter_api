import 'package:flutter/material.dart';
import 'package:flutter_api/provider/post_provider.dart';
import 'package:flutter_api/repositories/post_repo.dart';
import 'package:flutter_api/screens/home_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(repo: PostRepo()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  Itemwidget(),
      ),
    );
  }
}