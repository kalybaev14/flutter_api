import 'package:flutter_api/model/post_model.dart';
import 'package:http/http.dart'as http;

class PostRepo {
  Future<http.Response> getpost() async{
    final url=Uri.parse('https://jsonplaceholder.typicode.com/photos');
    return await http.get(url);
  }
}

/*List<PostModel> posts = [
  PostModel(id: 1, title: 'title', subtitle: 'subtitle'),
  PostModel(id: 2, title: 'titlsse', subtitle: 'subswstitle'),
  PostModel(id: 3, title: 'titlewe', subtitle: 'subtcdcdc2eitle'),
];*/
