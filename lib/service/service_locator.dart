import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/delete_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/get_usecase.dart';
import 'package:flutter_challenges/modules/product/domain/usecases/update_usecase.dart';
import 'package:flutter_challenges/modules/product/external/product_firebase.dart';
import 'package:flutter_challenges/modules/product/infra/datasources/product_datasource.dart';
import 'package:flutter_challenges/modules/product/infra/repositories/product_implement.dart';
import 'package:flutter_challenges/store/product_store/product_store.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  locator.registerSingleton<ProductDataSourceI>(
      ProductFirebase(firestore: FirebaseFirestore.instance));
  locator.registerSingleton<ProductRepositoryI>(
      ProductImplement(dataSourceI: locator()));
  locator.registerSingleton(
      ProductStore(getRepository: GetUseCase(repositoryI: locator())));
      locator.registerSingleton(DeleteUseCase(repositoryI: locator()));
       locator.registerSingleton(UpdateUseCase(repositoryI: locator()));
}
