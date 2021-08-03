// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  final _$productModelAtom = Atom(name: '_ProductStoreBase.productModel');

  @override
  ObservableList<ProductModel> get productModel {
    _$productModelAtom.reportRead();
    return super.productModel;
  }

  @override
  set productModel(ObservableList<ProductModel> value) {
    _$productModelAtom.reportWrite(value, super.productModel, () {
      super.productModel = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProductStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingUpdateAtom = Atom(name: '_ProductStoreBase.isLoadingUpdate');

  @override
  bool get isLoadingUpdate {
    _$isLoadingUpdateAtom.reportRead();
    return super.isLoadingUpdate;
  }

  @override
  set isLoadingUpdate(bool value) {
    _$isLoadingUpdateAtom.reportWrite(value, super.isLoadingUpdate, () {
      super.isLoadingUpdate = value;
    });
  }

  final _$isLoadingDeleteAtom = Atom(name: '_ProductStoreBase.isLoadingDelete');

  @override
  bool get isLoadingDelete {
    _$isLoadingDeleteAtom.reportRead();
    return super.isLoadingDelete;
  }

  @override
  set isLoadingDelete(bool value) {
    _$isLoadingDeleteAtom.reportWrite(value, super.isLoadingDelete, () {
      super.isLoadingDelete = value;
    });
  }

  final _$getProductAsyncAction = AsyncAction('_ProductStoreBase.getProduct');

  @override
  Future<Either<ProductException, List<ProductModel>>> getProduct() {
    return _$getProductAsyncAction.run(() => super.getProduct());
  }

  final _$updateAsyncAction = AsyncAction('_ProductStoreBase.update');

  @override
  Future<Either<ProductException, Message>> update(
      {ProductMapper productModel}) {
    return _$updateAsyncAction
        .run(() => super.update(productModel: productModel));
  }

  final _$deleteAsyncAction = AsyncAction('_ProductStoreBase.delete');

  @override
  Future<Either<ProductException, Message>> delete({String idProduct}) {
    return _$deleteAsyncAction.run(() => super.delete(idProduct: idProduct));
  }

  @override
  String toString() {
    return '''
productModel: ${productModel},
isLoading: ${isLoading},
isLoadingUpdate: ${isLoadingUpdate},
isLoadingDelete: ${isLoadingDelete}
    ''';
  }
}
