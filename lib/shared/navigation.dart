import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigatAndReplace(context , {
  required Widget screen
}){
  Navigator.pushReplacement(
      context, MaterialPageRoute(
      builder: (context) => screen));
}

void navigatTo(context , {
  required Widget screen
}){
  Navigator.push(
      context, MaterialPageRoute(
      builder: (context) => screen));
}
