import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';
import 'package:validators/validators.dart';

abstract class UpdateUseCaseI {
  Future<Either<ProductException, Message>> update(
      {ProductMapper productModel});
}

class UpdateUseCase implements UpdateUseCaseI {
  final ProductRepositoryI repositoryI;

  UpdateUseCase({this.repositoryI});
  @override
  Future<Either<ProductException, Message>> update(
      {ProductMapper productModel}) async {

        if(isNull(productModel?.documentReference?.id)){
          return Left(
          ProductException(message: "O id do documento não pode ser um campo vazio"));
        }
    if (isNull(productModel?.title)) {
      return Left(
          ProductException(message: "O titulo não pode ser um campo vazio"));
    }

    if (isNull(productModel?.type)) {
      return Left(ProductException(
          message: "O tipo de producto não pode ser um campo vazio"));
    }

    if (isNull(productModel?.price?.toString())) {
      return Left(
          ProductException(message: "digite o preço no formato valido"));
    }
    if (productModel.rating<0 || productModel.rating>4) {
      return Left(
          ProductException(message: "A avaliação não pode ser menor que 0 e maior que 4"));
    }

    return await repositoryI.update(productModel: productModel);
  }
}
