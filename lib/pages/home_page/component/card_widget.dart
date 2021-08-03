import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/product/domain/entities/product_model.dart';
import 'package:flutter_challenges/pages/product_edition_page/product_edition_page.dart';
import 'package:flutter_challenges/service/service_locator.dart';
import 'package:flutter_challenges/store/product_store/product_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardWidget extends StatefulWidget {
  final ProductModel product;
  const CardWidget({Key key, this.product}) : super(key: key);

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
              Container(
                width: 100,
                height: 100,
                child: Image.asset("assets/images/${widget.product.filename}"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.product?.title ?? ""),
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
                                          _productStore.getProduct();

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
