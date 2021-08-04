import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/modules/product/external/productMapper.dart';
import 'package:flutter_challenges/service/service_locator.dart';
import 'package:flutter_challenges/store/product_store/product_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'component/button_widget.dart';
import 'component/text_field_widget.dart';

class ProductEditionPage extends StatefulWidget {
  const ProductEditionPage({Key key, this.product}) : super(key: key);

  final ProductModel product;

  @override
  _ProductEditionPageState createState() => _ProductEditionPageState();
}

class _ProductEditionPageState extends State<ProductEditionPage> {
  GlobalKey<ScaffoldState> globalKey;
  ProductStore _productStore;
  TextEditingController txtTitle;
  TextEditingController txtType;
  TextEditingController txtDescription;
  TextEditingController txtHeight;
  TextEditingController txtWidth;
  TextEditingController txtPrice;
  TextEditingController txtRating;

  @override
  void initState() {
    globalKey = GlobalKey<ScaffoldState>();
    _productStore = locator.get<ProductStore>();
    txtTitle = TextEditingController(text: widget.product?.title??"");
    txtType = TextEditingController(text: widget.product?.type??"");
    txtDescription = TextEditingController(text: widget.product?.description??"");
    txtHeight = TextEditingController(text: widget.product?.height?.toString()??"");
    txtWidth = TextEditingController(text: widget.product?.width?.toString()??"");
    txtPrice = TextEditingController(text: widget.product?.price?.toString()??"");
    txtRating = TextEditingController(text: widget.product?.rating?.toString()??"");
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            TextFieldWidget(
              typeField: "Title",
              controller: txtTitle,
            ),
            TextFieldWidget(
              typeField: "Type",
              controller: txtType,
            ),
            TextFieldWidget(
              typeField: "Descrição",
              controller: txtDescription,
            ),
            TextFieldWidget(
                typeField: "Altura",
                controller: txtHeight,
                textInputType: TextInputType.number),
            TextFieldWidget(
                typeField: "Largura",
                controller: txtWidth,
                textInputType: TextInputType.number),
            TextFieldWidget(
              typeField: "Preço",
              textInputType: TextInputType.number,
              controller: txtPrice,
            ),
            TextFieldWidget(
              typeField: "Avaliação",
              textInputType: TextInputType.number,
              controller: txtRating,
            ),
            Observer(
              builder: (context) {
                return SharedButton(
                  isAnimating: _productStore.isLoadingUpdate,
                  onTaped: () => _productStore
                      .update(
                          productModel: ProductMapper(
                              title: txtTitle.text.trim(),
                              type: txtType.text.trim(),
                              description: txtDescription.text.trim(),
                              height: double.tryParse(txtHeight.text.trim()),
                              width: double.tryParse(txtWidth.text.trim()),
                              price: double.tryParse(txtPrice.text.trim()),
                              rating: int.tryParse(txtRating.text.trim()),
                              documentReference:
                                  widget.product.documentReference,
                              filename: widget.product?.filename))
                      .then((value) {
                    value.fold((l) {
                      return globalKey.currentState.showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(l?.message ?? ""),
                      ));
                    }, (r) {
                      if (r.sucess) {
                        globalKey.currentState.showSnackBar(SnackBar(
                          content: Text(r?.message ?? ""),
                        ));
                        _productStore.getProduct();
                        return Future.delayed(
                            Duration(seconds: 2), () => Navigator.pop(context));
                      }
                      return globalKey.currentState.showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(r?.message ?? ""),
                      ));
                    });
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
