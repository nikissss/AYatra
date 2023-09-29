import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
final void Function()? onTap;

MyButton({Key? key,this.onTap}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap as void Function()?,
      child: Container(
    padding:const  EdgeInsets.all(25),
    margin: const EdgeInsets.symmetric(horizontal:25),
    decoration:BoxDecoration(
    color:Colors.black,
    borderRadius: BorderRadius.circular(8),
    ),
        child: const Center(
          child:Text(
            'Sign In',
            style :TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            )),
      ),
    );
  }
}