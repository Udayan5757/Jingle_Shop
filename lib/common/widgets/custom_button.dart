import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(143, 148, 251, 1),
            Color.fromRGBO(143, 148, 251, .6),
          ],
        ),
      ),
      child: InkWell(
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: color==null?Colors.white:Colors.black),
        )),
        onTap: onTap,
      ),
    );
  }
}
// child: Text(
//         text,
//         style: TextStyle(fontSize: 17,color: color==null?Colors.white:Colors.black),
//       ),
