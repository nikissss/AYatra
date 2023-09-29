import 'package:flutter/material.dart';

class mytextfield extends StatelessWidget {
  final controller; //controller used to access what the user types in text field
  final String hintText; //hint to the user what should be typed in text field
  final bool obscureText; //boolean  , used to hide the password while typing in text field
  const mytextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding:const EdgeInsets.symmetric(horizontal:25.0),
  child:   TextField(
    controller: controller,
    decoration:InputDecoration(
      enabledBorder:const  OutlineInputBorder(
        borderSide: BorderSide(color:Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color:Colors.grey),
      ),
fillColor: const Color(0xFFE0E0E0), // Replace with the appropriate color code
      filled:true,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[500])
    ) ,
  ),
);
  }
}