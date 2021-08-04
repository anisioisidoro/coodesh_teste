import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/errors/error.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/delete_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/get_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/update_usecase.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final GetUseCaseI getRepository;
  final DeleteUseCase deleteRepository;
  final UpdateUseCase updateRepository;

  _ProductStoreBase(
      {this.getRepository, this.deleteRepository, this.updateRepository});

  @observable
  ObservableList<ProductModel> productModel =
      ObservableList<ProductModel>.of({});

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingUpdate = false;

  @observable
  bool isLoadingDelete = false;

  @action
  Future<Either<ProductException, List<ProductModel>>> getProduct() async {
    try {
      isLoading = true;
      var result = await getRepository.get();

      return result.fold(
          (l) => Left(l), (r) => Right(productModel = r.asObservable()));
    } catch (e) {
      return Left(ProductException(message: e));
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<Either<ProductException, Message>> update(
      {ProductMapper productModel}) async {
    try {
      isLoadingUpdate = true;
      var result = await updateRepository.update(productModel: productModel);

      return result.fold((l) => Left(l), (r) => Right(r));
    } catch (e) {
      return Left(ProductException(message: e.message));
    } finally {
      isLoadingUpdate = false;
    }
  }

  @action
  Future<Either<ProductException, Message>> delete({String idProduct}) async {
    try {
      isLoadingDelete = true;
      var result = await deleteRepository.delete(idProduct: idProduct);

      return result.fold((l) => Left(l), (r) => Right(r));
    } catch (e) {
      return Left(ProductException(message: e.message));
    } finally {
      isLoadingDelete = false;
    }
  }

  String convertDate(DateTime timestamp) {
    return DateFormat("dd-MM-yyyy").format(timestamp);
  }
}
