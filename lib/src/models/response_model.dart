// To parse this JSON data, do
//
//     final searchProductResponseModel = searchProductResponseModelFromJson(jsonString);

import 'dart:convert';

SearchProductResponseModel searchProductResponseModelFromJson(String str) =>
    SearchProductResponseModel.fromJson(json.decode(str));

String searchProductResponseModelToJson(SearchProductResponseModel data) =>
    json.encode(data.toJson());

class SearchProductResponseModel {
  SearchProductResponseModel({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory SearchProductResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchProductResponseModel(
        message: json["Message"] == null ? null : json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Message": message == null ? null : message,
        "Data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.list,
    this.categoryList,
    this.minPrize,
    this.maxPrize,
  });

  List<ListElement> list;
  List<CategoryList> categoryList;
  List<int> minPrize;
  List<int> maxPrize;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["List"] == null
            ? null
            : List<ListElement>.from(
                json["List"].map((x) => ListElement.fromJson(x))),
        categoryList: json["categoryList"] == null
            ? null
            : List<CategoryList>.from(
                json["categoryList"].map((x) => CategoryList.fromJson(x))),
        minPrize: json["minPrize"] == null
            ? null
            : List<int>.from(json["minPrize"].map((x) => x)),
        maxPrize: json["maxPrize"] == null
            ? null
            : List<int>.from(json["maxPrize"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "List": list == null
            ? null
            : List<dynamic>.from(list.map((x) => x.toJson())),
        "categoryList": categoryList == null
            ? null
            : List<dynamic>.from(categoryList.map((x) => x.toJson())),
        "minPrize": minPrize == null
            ? null
            : List<dynamic>.from(minPrize.map((x) => x)),
        "maxPrize": maxPrize == null
            ? null
            : List<dynamic>.from(maxPrize.map((x) => x)),
      };
}

class CategoryList {
  CategoryList({
    this.catId,
    this.catName,
    this.image,
    this.parentId,
    this.code,
    this.description,
    this.urlKey,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.delDate,
    this.categoryCommissionSlabs,
    this.productCategories,
  });

  int catId;
  String catName;
  String image;
  int parentId;
  String code;
  String description;
  String urlKey;
  String metaTitle;
  String metaKeywords;
  String metaDescription;
  String delDate;
  List<dynamic> categoryCommissionSlabs;
  List<dynamic> productCategories;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        catId: json["catId"] == null ? null : json["catId"],
        catName: json["catName"] == null ? null : json["catName"],
        image: json["image"] == null ? null : json["image"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
        urlKey: json["urlKey"] == null ? null : json["urlKey"],
        metaTitle: json["metaTitle"] == null ? null : json["metaTitle"],
        metaKeywords:
            json["metaKeywords"] == null ? null : json["metaKeywords"],
        metaDescription:
            json["metaDescription"] == null ? null : json["metaDescription"],
        delDate: json["delDate"] == null ? null : json["delDate"],
        categoryCommissionSlabs: json["CategoryCommissionSlabs"] == null
            ? null
            : List<dynamic>.from(json["CategoryCommissionSlabs"].map((x) => x)),
        productCategories: json["ProductCategories"] == null
            ? null
            : List<dynamic>.from(json["ProductCategories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "catId": catId == null ? null : catId,
        "catName": catName == null ? null : catName,
        "image": image == null ? null : image,
        "parentId": parentId == null ? null : parentId,
        "code": code == null ? null : code,
        "description": description == null ? null : description,
        "urlKey": urlKey == null ? null : urlKey,
        "metaTitle": metaTitle == null ? null : metaTitle,
        "metaKeywords": metaKeywords == null ? null : metaKeywords,
        "metaDescription": metaDescription == null ? null : metaDescription,
        "delDate": delDate == null ? null : delDate,
        "CategoryCommissionSlabs": categoryCommissionSlabs == null
            ? null
            : List<dynamic>.from(categoryCommissionSlabs.map((x) => x)),
        "ProductCategories": productCategories == null
            ? null
            : List<dynamic>.from(productCategories.map((x) => x)),
      };
}

class ListElement {
  ListElement({
    this.rNum,
    this.catName,
    this.imageUrl,
    this.vendorName,
    this.isWishlisted,
    this.rc,
    this.isReviewCount,
    this.isReviewAvgrating,
    this.productId,
    this.vendorid,
    this.prDate,
    this.actDate,
    this.prName,
    this.sku,
    this.unitPrice,
    this.description,
    this.shortDescription,
    this.urlKey,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.status,
    this.qoh,
    this.rank,
    this.availableFrom,
    this.availableTo,
    this.suspendedDate,
    this.newDate,
    this.delDate,
    this.maxQtyInOrders,
    this.soldQty,
    this.stockAvailability,
    this.backOrders,
    this.rol,
    this.roq,
    this.parentId,
    this.specialPrice,
    this.attributeSetId,
    this.cartItems,
    this.keywords,
    this.productAttributes,
    this.productCategories,
    this.productImages,
    this.vendor,
    this.productViews,
    this.reviews,
    this.wishLists,
  });

  int rNum;
  String catName;
  String imageUrl;
  String vendorName;
  bool isWishlisted;
  int rc;
  int isReviewCount;
  int isReviewAvgrating;
  int productId;
  int vendorid;
  DateTime prDate;
  dynamic actDate;
  String prName;
  String sku;
  int unitPrice;
  String description;
  String shortDescription;
  String urlKey;
  String metaTitle;
  String metaKeywords;
  String metaDescription;
  String status;
  String qoh;
  String rank;
  String availableFrom;
  String availableTo;
  String suspendedDate;
  String newDate;
  String delDate;
  String maxQtyInOrders;
  dynamic soldQty;
  String stockAvailability;
  String backOrders;
  String rol;
  String roq;
  String parentId;
  String specialPrice;
  String attributeSetId;
  List<dynamic> cartItems;
  List<dynamic> keywords;
  List<dynamic> productAttributes;
  List<dynamic> productCategories;
  List<dynamic> productImages;
  String vendor;
  List<dynamic> productViews;
  List<dynamic> reviews;
  List<dynamic> wishLists;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        rNum: json["rNum"] == null ? null : json["rNum"],
        catName: json["catName"] == null ? null : json["catName"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        vendorName: json["vendorName"] == null ? null : json["vendorName"],
        isWishlisted:
            json["IsWishlisted"] == null ? null : json["IsWishlisted"],
        rc: json["rc"] == null ? null : json["rc"],
        isReviewCount:
            json["IsReviewCount"] == null ? null : json["IsReviewCount"],
        isReviewAvgrating: json["IsReviewAvgrating"] == null
            ? null
            : json["IsReviewAvgrating"],
        productId: json["productId"] == null ? null : json["productId"],
        vendorid: json["vendorid"] == null ? null : json["vendorid"],
        prDate: json["prDate"] == null ? null : DateTime.parse(json["prDate"]),
        actDate: json["actDate"],
        prName: json["prName"] == null ? null : json["prName"],
        sku: json["sku"] == null ? null : json["sku"],
        unitPrice: json["unitPrice"] == null ? null : json["unitPrice"],
        description: json["description"] == null ? null : json["description"],
        shortDescription:
            json["shortDescription"] == null ? null : json["shortDescription"],
        urlKey: json["urlKey"] == null ? null : json["urlKey"],
        metaTitle: json["metaTitle"] == null ? null : json["metaTitle"],
        metaKeywords:
            json["metaKeywords"] == null ? null : json["metaKeywords"],
        metaDescription:
            json["metaDescription"] == null ? null : json["metaDescription"],
        status: json["status"] == null ? null : json["status"],
        qoh: json["qoh"] == null ? null : json["qoh"],
        rank: json["rank"] == null ? null : json["rank"],
        availableFrom:
            json["availableFrom"] == null ? null : json["availableFrom"],
        availableTo: json["availableTo"] == null ? null : json["availableTo"],
        suspendedDate:
            json["suspendedDate"] == null ? null : json["suspendedDate"],
        newDate: json["newDate"] == null ? null : json["newDate"],
        delDate: json["delDate"] == null ? null : json["delDate"],
        maxQtyInOrders:
            json["maxQtyInOrders"] == null ? null : json["maxQtyInOrders"],
        soldQty: json["soldQty"],
        stockAvailability: json["stockAvailability"] == null
            ? null
            : json["stockAvailability"],
        backOrders: json["backOrders"] == null ? null : json["backOrders"],
        rol: json["rol"] == null ? null : json["rol"],
        roq: json["roq"] == null ? null : json["roq"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        specialPrice:
            json["specialPrice"] == null ? null : json["specialPrice"],
        attributeSetId:
            json["attributeSetId"] == null ? null : json["attributeSetId"],
        cartItems: json["CartItems"] == null
            ? null
            : List<dynamic>.from(json["CartItems"].map((x) => x)),
        keywords: json["Keywords"] == null
            ? null
            : List<dynamic>.from(json["Keywords"].map((x) => x)),
        productAttributes: json["ProductAttributes"] == null
            ? null
            : List<dynamic>.from(json["ProductAttributes"].map((x) => x)),
        productCategories: json["ProductCategories"] == null
            ? null
            : List<dynamic>.from(json["ProductCategories"].map((x) => x)),
        productImages: json["ProductImages"] == null
            ? null
            : List<dynamic>.from(json["ProductImages"].map((x) => x)),
        vendor: json["Vendor"] == null ? null : json["Vendor"],
        productViews: json["ProductViews"] == null
            ? null
            : List<dynamic>.from(json["ProductViews"].map((x) => x)),
        reviews: json["Reviews"] == null
            ? null
            : List<dynamic>.from(json["Reviews"].map((x) => x)),
        wishLists: json["WishLists"] == null
            ? null
            : List<dynamic>.from(json["WishLists"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "rNum": rNum == null ? null : rNum,
        "catName": catName == null ? null : catName,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "vendorName": vendorName == null ? null : vendorName,
        "IsWishlisted": isWishlisted == null ? null : isWishlisted,
        "rc": rc == null ? null : rc,
        "IsReviewCount": isReviewCount == null ? null : isReviewCount,
        "IsReviewAvgrating":
            isReviewAvgrating == null ? null : isReviewAvgrating,
        "productId": productId == null ? null : productId,
        "vendorid": vendorid == null ? null : vendorid,
        "prDate": prDate == null ? null : prDate.toIso8601String(),
        "actDate": actDate,
        "prName": prName == null ? null : prName,
        "sku": sku == null ? null : sku,
        "unitPrice": unitPrice == null ? null : unitPrice,
        "description": description == null ? null : description,
        "shortDescription": shortDescription == null ? null : shortDescription,
        "urlKey": urlKey == null ? null : urlKey,
        "metaTitle": metaTitle == null ? null : metaTitle,
        "metaKeywords": metaKeywords == null ? null : metaKeywords,
        "metaDescription": metaDescription == null ? null : metaDescription,
        "status": status == null ? null : status,
        "qoh": qoh == null ? null : qoh,
        "rank": rank == null ? null : rank,
        "availableFrom": availableFrom == null ? null : availableFrom,
        "availableTo": availableTo == null ? null : availableTo,
        "suspendedDate": suspendedDate == null ? null : suspendedDate,
        "newDate": newDate == null ? null : newDate,
        "delDate": delDate == null ? null : delDate,
        "maxQtyInOrders": maxQtyInOrders == null ? null : maxQtyInOrders,
        "soldQty": soldQty,
        "stockAvailability":
            stockAvailability == null ? null : stockAvailability,
        "backOrders": backOrders == null ? null : backOrders,
        "rol": rol == null ? null : rol,
        "roq": roq == null ? null : roq,
        "parentId": parentId == null ? null : parentId,
        "specialPrice": specialPrice == null ? null : specialPrice,
        "attributeSetId": attributeSetId == null ? null : attributeSetId,
        "CartItems": cartItems == null
            ? null
            : List<dynamic>.from(cartItems.map((x) => x)),
        "Keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords.map((x) => x)),
        "ProductAttributes": productAttributes == null
            ? null
            : List<dynamic>.from(productAttributes.map((x) => x)),
        "ProductCategories": productCategories == null
            ? null
            : List<dynamic>.from(productCategories.map((x) => x)),
        "ProductImages": productImages == null
            ? null
            : List<dynamic>.from(productImages.map((x) => x)),
        "Vendor": vendor == null ? null : vendor,
        "ProductViews": productViews == null
            ? null
            : List<dynamic>.from(productViews.map((x) => x)),
        "Reviews":
            reviews == null ? null : List<dynamic>.from(reviews.map((x) => x)),
        "WishLists": wishLists == null
            ? null
            : List<dynamic>.from(wishLists.map((x) => x)),
      };
}
