import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_api/model/post_model.dart';
import 'package:flutter_api/repositories/post_repo.dart';

class PostProvider with ChangeNotifier{
   PostProvider({required this.repo});
  final PostRepo repo;
  List<PostModel> posts=[];
   bool isloading=false;
 void getpost () async{
  try{
 isloading=true;
 notifyListeners();
 await Future.delayed(const Duration(seconds: 1));
 final result= await repo.getpost(); 
 final data=json.decode(result.body)as List; 
 posts=data.map((e) => PostModel.fromjson(e)).toList();
 isloading=false;
 notifyListeners();
  } catch(e){

  }
 }
}