import 'package:flutter/material.dart';
import 'package:flutter_api/provider/post_provider.dart';
import 'package:provider/provider.dart';

class Itemwidget extends StatelessWidget {
  const Itemwidget({super.key});
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PostProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: context.read<PostProvider>().getpost,
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: vm.isloading
          ? Center(
              child: const CircularProgressIndicator(),
            )
          : vm.posts.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: ((context, index) => MyWidget(
                        id: vm.posts[index].id.toString(),
                        title: vm.posts[index].title,
                        network: vm.posts[index].network,
                      )),
                  itemCount: vm.posts.length,
                )
              : Center(
                  child: const Text(
                    'Данные еще не загружены!',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.id,
    required this.title,
    required this.network,
  });
  final String title;
  final String id;
  final String network;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          id,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Container(
          width: 140,
          height: 15,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 15),
        Container(width: 140, height: 119, child: Image.network(network)),
        SizedBox(height: 15),
      ],
    );
  }
}
