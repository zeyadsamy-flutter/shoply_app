import 'package:flutter/material.dart';

class ProductSelectedController extends ValueNotifier<int> {
  ProductSelectedController() : super(0);
  void increment() => value++;
  
}
