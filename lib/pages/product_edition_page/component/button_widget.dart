import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final Function onTaped;
  final bool isAnimating;
  const SharedButton({Key key, this.onTaped, this.isAnimating = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: AnimatedContainer(
          height: 48,
          width: isAnimating ? 46 : 312,
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
              color: Color(0xFFE01E69),
              borderRadius: BorderRadius.circular(isAnimating ? 100 : 8)),
          child: Center(
            child: isAnimating
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white)
                    )
                : Text("Atualizar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500)),
          ),
        ),
        onTap: isAnimating ? null : onTaped,
      ),
    );
  }
}