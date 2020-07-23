import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;

  StarRating({this.rating});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.rating > 0
            ? Icon(
                Icons.star,
                color: Colors.amber,
              )
            : Icon(Icons.star_border, color: Colors.amber),
        widget.rating > 1
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border, color: Colors.amber),
        widget.rating > 2
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border, color: Colors.amber),
        widget.rating > 3
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border, color: Colors.amber),
        widget.rating > 4
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border, color: Colors.amber),
      ],
    );
  }
}
