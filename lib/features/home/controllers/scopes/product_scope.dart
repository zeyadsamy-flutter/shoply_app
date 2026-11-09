import 'package:flutter/material.dart';

import '../controller/product_selected_controller.dart';

class ProductScope extends InheritedNotifier<ProductSelectedController> {
  const ProductScope({
    super.key,
    required ProductSelectedController controller,
    required super.child,
  }) : super(notifier: controller);

  static ProductSelectedController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductScope>()!
        .notifier!;
  }

  static ProductSelectedController read(BuildContext context) {
    return context.getInheritedWidgetOfExactType<ProductScope>()!.notifier!;
  }
}
