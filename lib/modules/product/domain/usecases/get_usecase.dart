import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';

abstract class GetUseCaseI {
  Future<Either<ProductException, List<ProductModel>>> get();
}

class GetUseCase implements GetUseCaseI {
  final ProductRepositoryI repositoryI;

  GetUseCase({this.repositoryI});
  @override
  Future<Either<ProductException, List<ProductModel>>> get() {
    return repositoryI.get();
  }
}
