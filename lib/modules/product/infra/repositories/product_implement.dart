import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';
import 'package:flutter_challenges/modules/product/infra/datasources/product_datasource.dart';

class ProductImplement implements ProductRepositoryI {
  final ProductDataSourceI dataSourceI;

  ProductImplement({this.dataSourceI});

  @override
  Future<Either<ProductException, List<ProductModel>>> get() async {
    try {
      final product = await dataSourceI.get();
      return Right(product);
    } on ProductException catch (e) {
      return Left(ProductException(message: e.message));
    } on Exception {
      return Left(
          ProductException(message: "Erro, verifique a conexão de internet"));
    }
  }

  @override
  Future<Either<ProductException, Message>> delete({String idProduct}) async {
    try {
      final product = await dataSourceI.delete(idProduct: idProduct);
      return Right(product);
    } on ProductException catch (e) {
      return Left(ProductException(message: e.message));
    } on Exception {
      return Left(
          ProductException(message: "Erro, verifique a conexão de internet"));
    }
  }

  @override
  Future<Either<ProductException, Message>> update({ProductMapper productModel}) async{
     try {
      final product = await dataSourceI.update(productModel: productModel);
      return Right(product);
    } on ProductException catch (e) {
      return Left(ProductException(message: e.message));
    } on Exception {
      return Left(
          ProductException(message: "Erro, verifique a conexão de internet"));
    }
  }
}
