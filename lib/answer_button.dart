import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answertext, required this.ontap});

  final String answertext;
  final void Function() ontap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          backgroundColor: const Color.fromARGB(255, 18, 1, 56),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: Text(
        answertext,
        textAlign: TextAlign.center,
      ),
    );
  }
}
