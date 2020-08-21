import 'package:flutter/material.dart';
import 'package:jsonplaceholder/screens/photo_tab.dart';
import 'package:jsonplaceholder/screens/post_tab.dart';
import 'package:jsonplaceholder/screens/todo_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('JsonPlaceholder'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Posts',
              ),
              Tab(
                text: 'Photos',
              ),
              Tab(
                text: 'Todos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PostTab(),
            PhotoTab(),
            TodoTab(),
          ],
        ),
      ),
    );
  }
}
