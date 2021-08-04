import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';

class ProductMapper {
  ProductMapper({
    this.title,
    this.type,
    this.description,
    this.filename,
    this.height,
    this.width,
    this.price,
    this.rating,
    this.documentReference,
    this.dateTime,
  });

  String title;
  String type;
  String description;
  String filename;
  double height;
  double width;
  double price;
  int rating;
  DateTime dateTime;
  DocumentReference documentReference;

  static ProductModel fromDocument(
    QueryDocumentSnapshot doc,
  ) =>
      ProductModel(
          title: doc.data()["title"] == null ? null : doc.data()["title"],
          type: doc.data()["type"] == null ? null : doc.data()["type"],
          description: doc.data()["description"] == null
              ? null
              : doc.data()["description"],
          filename:
              doc.data()["filename"] == null ? null : doc.data()["filename"],
          height: doc.data()["height"] == null
              ? null
              : doc.data()["height"].toDouble(),
          width: doc.data()["width"] == null
              ? null
              : doc.data()["width"].toDouble(),
          price: doc.data()["price"] == null
              ? null
              : doc.data()["price"].toDouble(),
          rating: doc.data()["rating"] == null ? null : doc.data()["rating"],
          documentReference: doc.reference == null ? null : doc.reference,
          dateTime: doc.data()["created"] == null ? null : (doc.data()["created"] as Timestamp).toDate(),
          );
         

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "filename": filename == null ? null : filename,
        "height": height == null ? null : height,
        "width": width == null ? null : width,
        "price": price == null ? null : price,
        "rating": rating == null ? null : rating,
      };
}
