
import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';


abstract class ProductRepositoryI {
  Future<Either<ProductException, List<ProductModel>>> get();
  Future<Either<ProductException, Message>> delete({String idProduct});
  Future<Either<ProductException, Message>> update({ProductMapper productModel});
}
