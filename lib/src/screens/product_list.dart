import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/widgets/circular_progress.dart';
import 'package:flutter_assignment/src/widgets/star_rating.dart';
import 'package:flutter_share/flutter_share.dart';

import 'file:///G:/Projects/Flutter%20Projects/flutter_assignment/lib/src/models/request_model.dart';
import 'file:///G:/Projects/Flutter%20Projects/flutter_assignment/lib/src/resources/utils.dart';

class ProductList extends StatefulWidget {
  final String searchString;

  ProductList({this.searchString});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool loading = true;
  bool error = false;
  Response response;
  Dio dio = new Dio();
  dynamic responseModel;
  List<dynamic> result;

  @override
  void initState() {
    super.initState();
    checkNetwork();
    getHttp();
  }

  Future<void> share({
    String productName,
  }) async {
    await FlutterShare.share(
        title: productName,
        text: 'Hey,check this out.',
        linkUrl: 'https://intertoons.com/',
        chooserTitle: 'Product Share');
  }

  void getHttp() async {
    try {
      Response response = await Dio().post(
          "https://wd.intertoons.net/itecomapi/api/v2/Product/Search",
          data: SearchProductRequestModel(
              currentpage: "1",
              custId: null,
              filter: Filter(category: null),
              guestId: null,
              maxPrice: "100000",
              minPrice: "0",
              pagesize: "100",
              searchstring: widget.searchString,
              sortorder: Sortorder(direction: "asc", field: "prName")));
      print(response);
      if (response.statusCode == 200) {
        responseModel = response.data;
        print(responseModel["Data"]["List"]);
        result = responseModel["Data"]["List"];
        print(result[0]["imageUrl"]);
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
      print(e);
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        brightness: Brightness.dark,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Search Results",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: <Widget>[
          Icon(
            Icons.dehaze,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: loading == false
          ? Container(
              child: error == false
                  ? ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (bc, index) {
                        return index == 0
                            ? Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.grey.withOpacity(.26),
                                    height: 50,
                                    width: screenWidth(context, dividedBy: 1.1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.list,
                                          color: Colors.grey,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.import_export,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "Order by",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.filter_list,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "Filter",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    child: Container(
                                      width: screenWidth(context, dividedBy: 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth(context,
                                                      dividedBy: 1.2)),
                                              child: GestureDetector(
                                                child: Icon(
                                                  Icons.share,
                                                  color: Colors.grey,
                                                ),
                                                onTap: () {
                                                  share(
                                                      productName: result[index]
                                                          ["prName"]);
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: screenWidth(context,
                                                  dividedBy: 1.2),
                                              height: screenHeight(context,
                                                  dividedBy: 6),
                                              child: Image.network(
                                                  "https://wd.intertoons.net/ecomadmin/" +
                                                      result[index]
                                                          ["imageUrl"]),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                width: screenWidth(context,
                                                    dividedBy: 2),
                                                child: Text(
                                                  result[index]["prName"],
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.56),
                                                      fontSize: 18),
                                                )),
                                            Row(
                                              children: <Widget>[
                                                StarRating(
                                                  rating: result[index]
                                                      ["IsReviewAvgrating"],
                                                ),
                                                Text(
                                                  "(" +
                                                      result[index]
                                                              ["IsReviewCount"]
                                                          .toString() +
                                                      ")",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.56)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Text(
                                                "  Rs " +
                                                    result[index]["unitPrice"]
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(.56)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Card(
                                child: Container(
                                  width: screenWidth(context, dividedBy: 1.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: screenWidth(context,
                                                  dividedBy: 1.2)),
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.grey,
                                            ),
                                            onTap: () {
                                              share(
                                                  productName: result[index]
                                                      ["prName"]);
                                            },
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth(context,
                                              dividedBy: 1.2),
                                          height: screenHeight(context,
                                              dividedBy: 6),
                                          child: Image.network(
                                              "https://wd.intertoons.net/ecomadmin/" +
                                                  result[index]["imageUrl"]),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            width: screenWidth(context,
                                                dividedBy: 2),
                                            child: Text(
                                              result[index]["prName"],
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.56),
                                                  fontSize: 18),
                                            )),
                                        Row(
                                          children: <Widget>[
                                            StarRating(
                                              rating: result[index]
                                                  ["IsReviewAvgrating"],
                                            ),
                                            Text(
                                              "(" +
                                                  result[index]["IsReviewCount"]
                                                      .toString() +
                                                  ")",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.56)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            "  Rs " +
                                                result[index]["unitPrice"]
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.56)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      })
                  : Container(
                      child: Center(
                          child: Text(
                        "Sorry No Results Found!",
                        style: TextStyle(color: Colors.grey),
                      )),
                    ),
            )
          : BuildCircularProgress(),
    );
  }
}
