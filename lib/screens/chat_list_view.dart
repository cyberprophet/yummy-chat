import 'package:flutter/material.dart';

class MyListViewController extends StatefulWidget {
  @override
  _MyListViewControllerState createState() => _MyListViewControllerState();
}

class _MyListViewControllerState extends State<MyListViewController> {
  ScrollController _scrollController;  
  List<String> logs = ['Item 0', 'Item 1', 'Item 2', 'Item 3', 'Item 4'];
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView(
      controller: _scrollController,
      children: List.generate(
        logs.length,
        (index) {
          if (index == logs.length - 1 &&
              ScrollDirection.idle ==
                  _scrollController.position.userScrollDirection) {
            WidgetsBinding.instance.addPostFrameCallback((_) =>
                _scrollController.jumpTo(
                    _scrollController.position.maxScrollExtent));
          }
          return ListTile(
            title: Text(logs[index]),
          );
      ),
    );
}
        
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ListView Controller Example'),
      ),
      body: MyListViewController(),
    ),
  ));
}
