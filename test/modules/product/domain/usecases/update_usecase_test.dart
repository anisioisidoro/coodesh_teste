import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/message/message.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/get_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/update_usecase.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ProductRepositoryIMok extends Mock implements ProductRepositoryI {}

void main() {
  final repository = ProductRepositoryIMok();
  final updateUseCase = UpdateUseCase(repositoryI: repository);

  test('should give error when title is invalid', () async {
    when(repository.update(
            productModel: ProductMapper(title: "", type: "cc", price: 200)))
        .thenAnswer((realInvocation) async => Right(
            Message(message: "producto atualizado com suesso", sucess: true)));
    final result = await updateUseCase.update(
        productModel: ProductMapper(title: "", type: "cc", price: 200));

    expect(result.isLeft(), true);
    expect(
        result.fold((l) {
          print(l.message);
          return l;
        }, (r) => r),
        isNotNull);
  });

  test('should give error when type is invalid', () async {
    when(repository.update(
            productModel: ProductMapper(title: "title", price: 200)))
        .thenAnswer((realInvocation) async => Right(
            Message(message: "producto atualizado com suesso", sucess: true)));
    final result = await updateUseCase.update(
        productModel: ProductMapper(title: "title", price: 200));

    expect(result.isLeft(), true);
    expect(
        result.fold((l) {
          print(l.message);
          return l;
        }, (r) => r),
        isNotNull);
  });
  test('should give error when prince is invalid', () async {
    when(repository.update(
            productModel: ProductMapper(title: "title", type: "ccc")))
        .thenAnswer((realInvocation) async => Right(
            Message(message: "producto atualizado com suesso", sucess: true)));
    final result = await updateUseCase.update(
        productModel: ProductMapper(
      title: "title",
      type: "ccc",
    ));

    expect(result.isLeft(), true);
    expect(
        result.fold((l) {
          print(l.message);
          return l;
        }, (r) => r),
        isNotNull);
  });
}
