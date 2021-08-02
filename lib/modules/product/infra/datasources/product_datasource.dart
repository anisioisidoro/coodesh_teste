import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';

abstract class ProductDataSourceI {
   Future<List<ProductModel>> get();
   Future<Message> delete({String idProduct});
   Future<Message> update({ProductMapper productModel});
}
