import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';
import 'package:flutter_challenges/modules/product/infra/datasources/product_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductFirebase implements ProductDataSourceI {
  final FirebaseFirestore firestore;

  ProductFirebase({this.firestore});
  @override
  Future<List<ProductModel>> get() async {
    var document = await firestore.collection("products").get();
    return document.docs.map((doc) {
      return ProductMapper.fromDocument(doc);
    }).toList();
  }

  @override
  Future<Message> delete({String idProduct}) async {
    var documentVerify =
        await firestore.collection("products").doc(idProduct).get();

    if (documentVerify.exists) {
      await firestore.collection("products").doc(idProduct).delete();
      return Message(message: "producto eliminado com sucesso", sucess: true);
    }

    return Message(message: "Producto inexistente", sucess: false);
  }

  @override
  Future<Message> update({ProductMapper productModel}) async {
    var documentVerify = await firestore
        .collection("products")
        .doc(productModel.documentReference.id)
        .get();
    if (documentVerify.exists) {
       await firestore
          .collection("products")
          .doc(productModel.documentReference.id)
          .update(productModel.toJson());
      return Message(message: "producto atualizado com sucesso", sucess: true);
    }
    return Message(message: "Producto inexistente", sucess: false);
  }
}
