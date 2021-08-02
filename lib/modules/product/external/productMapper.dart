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
  });

  String title;
  String type;
  String description;
  String filename;
  int height;
  int width;
  double price;
  int rating;
  DocumentReference documentReference;

  static ProductModel fromDocument(Map<String, dynamic> doc) => ProductModel(
        title: doc["title"] == null ? null : doc["title"],
        type: doc["type"] == null ? null : doc["type"],
        description: doc["description"] == null ? null : doc["description"],
        filename: doc["filename"] == null ? null : doc["filename"],
        height: doc["height"] == null ? null : doc["height"],
        width: doc["width"] == null ? null : doc["width"],
        price: doc["price"] == null ? null : doc["price"].toDouble(),
        rating: doc["rating"] == null ? null : doc["rating"],
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
