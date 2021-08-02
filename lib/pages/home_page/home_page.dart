import 'package:flutter/material.dart';

import 'component/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          CardWidget(),
          CardWidget(),
          CardWidget(),
          CardWidget(),
          CardWidget(),
          CardWidget(),
        ],
      ),
      bottomNavigationBar: Container(
          width: size.width,
          height: 70,
          color: Color(0xFFDFE6ED),
          child: Center(
            child: Icon(
              Icons.home,
              size: 60,
            ),
          )),
    );
  }
}
