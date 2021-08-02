import 'package:dartz/dartz.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/get_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ProductRepositoryIMok extends Mock implements ProductRepositoryI {}

void main() {
  final repository = ProductRepositoryIMok();
  final getUseCase = GetUseCase(repositoryI: repository);
  test('should return a right value', () async {
    when(repository.get()).thenAnswer((realInvocation) async => Right([
          ProductModel(
              title: "Brown eggs",
              type: "dairy",
              description: "Raw organic brown eggs in a basket",
              filename: "0.jpg",
              height: 600,
              width: 400,
              price: 28.1,
              rating: 4),
          ProductModel(
              title: "Sweet fresh stawberry",
              type: "fruit",
              description: "Sweet fresh stawberry on the wooden table",
              filename: "1.jpg",
              height: 450,
              width: 299,
              price: 29.45,
              rating: 4)
        ]));
    final result = await getUseCase.get();

     expect(result.isRight(), true);
     expect(result.getOrElse(() => [ProductModel(), ProductModel()]).length, 2);

  });
}
