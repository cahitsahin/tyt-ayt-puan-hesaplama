import 'package:flutter/material.dart';
class Lesson{
  String name;
  int numOfQuestion;
  int trueAnswers;
  int falseAnswers;
  TextEditingController trueControl;
  TextEditingController falseControl;

  Lesson(this.name,this.numOfQuestion,this.trueAnswers,this.falseAnswers,this.trueControl,this.falseControl);

}