import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'file:///G:/Projects/Flutter%20Projects/flutter_assignment/lib/src/resources/utils.dart';
import 'file:///G:/Projects/Flutter%20Projects/flutter_assignment/lib/src/screens/product_list.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool connected = true;
  Response response;
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
    checkNetwork();
  }

  TextEditingController textEditingControllerSearch =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        brightness: Brightness.dark,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: Container(
          width: screenWidth(context, dividedBy: 1),
          height: screenHeight(context, dividedBy: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: TextField(
            autocorrect: false,
            controller: textEditingControllerSearch,
            onSubmitted: (_) {
              if (textEditingControllerSearch.text == "" ||
                  textEditingControllerSearch.text == null) {
                showToast("Please enter search input");
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductList(
                            searchString: textEditingControllerSearch.text,
                          )),
                );
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              fillColor: Colors.black,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.orangeAccent,
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
