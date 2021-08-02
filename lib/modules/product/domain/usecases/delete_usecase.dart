import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';

abstract class DeleteUsecaseI {
  Future<Either<ProductException, Message>> delete({String idProduct});
}

class DeleteUseCase implements DeleteUsecaseI {
  final ProductRepositoryI repositoryI;

  DeleteUseCase({this.repositoryI});

  @override
  Future<Either<ProductException, Message>> delete({String idProduct}) async {
    if (idProduct.isEmpty) {
      return Left(ProductException(message: "Producto não selecionado"));
    }

    return await repositoryI.delete(idProduct: idProduct);
  }
}
