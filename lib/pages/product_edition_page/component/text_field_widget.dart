import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key key, this.controller, this.typeField, this.textInputType}) : super(key: key);

  final TextEditingController controller;
  final String typeField;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(typeField ?? ""),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color(0xFFF5F5F5),
                  border: Border.all(width: 0, color: Colors.black)),
              child: Center(
                child: TextField(
                  keyboardType: textInputType?? TextInputType.text,
                  textAlign: TextAlign.center,
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "",
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
