import 'package:cloud_firestore/cloud_firestore.dart';



class ProductModel {
  ProductModel({
    this.title,
    this.type,
    this.description,
    this.filename,
    this.height,
    this.width,
    this.price,
    this.rating,
    this.documentReference,
  });

  String title;
  String type;
  String description;
  String filename;
  double height;
  double width;
  double price;
  int rating;
  DocumentReference documentReference;
}
