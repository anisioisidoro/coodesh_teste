import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/delete_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/get_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/update_usecase.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final GetUseCaseI getRepository;
  final DeleteUseCase deleteRepository;
  final UpdateUseCase updateRepository;

  _ProductStoreBase({this.getRepository, this.deleteRepository, this.updateRepository}) {
    getProduct();
  }

  @action
  Future<Either<ProductException, List<ProductModel>>> getProduct() async {
    var result = await getRepository.get();

    result.fold((l) => print(l), (r) {
      r.map((e) {
        print(e.title);
      }).toList();
    });
  }
}
