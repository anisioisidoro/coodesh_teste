import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/pages/product_page/product_edition_page.dart';

import 'package:flutter_challenges/service/service_locator.dart';
import 'package:flutter_challenges/store/product_store/product_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatefulWidget {
  final ProductModel product;
  final GlobalKey<ScaffoldState> globalKey;
  const CardWidget({this.globalKey, this.product});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  ProductStore _productStore;

  @override
  void initState() {
    _productStore = locator.get<ProductStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        height: 200,
        width: 10,
        decoration: BoxDecoration(),
        child: Card(
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 20),
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/${widget.product.filename}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                      "Created: ${_productStore.convertDate(widget.product.dateTime)}")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      widget.product?.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Row(
                    children: List.generate(widget.product?.rating ?? 0,
                        (index) => Icon(Icons.star, color: Color(0xFF5F52F3))),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PopupMenuButton(
                    child: Icon(Icons.more_horiz),
                    onSelected: (value) {
                      if (value == 1) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductEditionPage(
                                      product: widget.product,
                                    )));
                      }

                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return Observer(
                              builder: (_) {
                                if (_productStore.isLoadingDelete) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                return AlertDialog(
                                  content: Text("Deseja eliminar o producto?"),
                                  actions: [
                                    GestureDetector(
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE01E69),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                            child: Text(
                                          "Sim",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                      onTap: () {
                                        _productStore
                                            .delete(
                                                idProduct: widget.product
                                                    .documentReference.id)
                                            .then((value) {
                                          value.fold((l) {
                                            return widget.globalKey.currentState
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(l?.message ?? ""),
                                            ));
                                          }, (r) {
                                            if (r.sucess) {
                                              widget.globalKey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(r?.message ?? ""),
                                              ));
                                             return  _productStore.getProduct();
                                              
                                            }
                                            return widget.globalKey.currentState
                                                .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.red,
                                              content: Text(r?.message ?? ""),
                                            ));
                                          });

                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE01E69)
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                            child: Text(
                                          "Não",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                      onTap: () => Navigator.pop(context),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Editar"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Eliminar"),
                      ),
                    ],
                  ),
                  Text("R\$ ${widget.product?.price ?? ""}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
