import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key key}) : super(key: key);

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
                child: Image.network(
                    "https://www.neappoli.com/static/media/flutterImg.94b8139a.png"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Titulo aqui mesmo"),
                  Row(
                    children: List.generate(3,
                        (index) => Icon(Icons.star, color: Color(0xFF5F52F3))),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PopupMenuButton(
                    child: Icon(Icons.more_horiz),
                    onSelected: (value) {},
                    itemBuilder: (context) {
                      return List.generate(5, (index) {
                        return PopupMenuItem(
                          value: 2,
                          child: Text('button no $index'),
                        );
                      });
                    },
                  ),
                  Text("R\$22"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
