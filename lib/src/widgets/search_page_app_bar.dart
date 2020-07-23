import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/resources/utils.dart';
import 'package:flutter_assignment/src/screens/product_list.dart';

class SearchAppBar extends StatefulWidget {
  final TextEditingController textEditingController;

  SearchAppBar({this.textEditingController});

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          controller: widget.textEditingController,
          onSubmitted: (_) {
            if (widget.textEditingController.text == "" ||
                widget.textEditingController.text == null) {
              showToast("Please enter search input");
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductList(
                          searchString: widget.textEditingController.text,
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
    );
  }
}
