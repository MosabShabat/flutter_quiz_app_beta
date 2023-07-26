import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final answer, function;
  
  const Answer({
    super.key,
    required this.answer,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: double.infinity,
        child: MaterialButton(
          padding:const EdgeInsets.symmetric(vertical: 15),
          onPressed: function,
          child: Text(
            answer,
            style:const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}