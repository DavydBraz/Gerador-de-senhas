import 'package:flutter/material.dart';

Text textTitle(String text) {
  return Text(text, style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 223, 221, 221), fontWeight: FontWeight.w400),);
}

Text textCheckBox(String text){
  return Text(text, style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 223, 221, 221)),);
}

Text textMenu(String text){
  return Text(text, style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 223, 221, 221)),);
}

Text textPass(String text){
  return Text(text, style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 223, 221, 221)),);
}