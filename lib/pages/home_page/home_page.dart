import 'package:flutter/material.dart';
import 'package:flutter_challenges/service/service_locator.dart';
import 'package:flutter_challenges/store/product_store/product_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'component/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductStore productStore;
  GlobalKey<ScaffoldState> globalKey;

  @override
  void initState() {
    productStore = locator.get<ProductStore>();
    globalKey = GlobalKey<ScaffoldState>();
    productStore.getProduct();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      body: Observer(
        builder: (_) {
          if (productStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (productStore?.productModel == null ||
              productStore.productModel.length == 0) {
            return Center(child: Text("Não há productos"));
          }

          return ListView.builder(
            itemCount: productStore.productModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: CardWidget(
                  globalKey: globalKey,
                  product: productStore.productModel[index],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
          width: size.width,
          height: 70,
          color: Color(0xFFDFE6ED),
          child: Center(
            child: Icon(
              Icons.home,
              size: 60,
              color: Colors.white,
            ),
          )),
    );
  }
}
