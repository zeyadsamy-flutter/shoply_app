import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/controller/product_grid_controller.dart';

class ProductGridScope extends InheritedNotifier<ProductGridController> {
  const ProductGridScope({
    super.key,
    required ProductGridController controller,
    required super.child,
  }) : super(notifier: controller);

  static ProductGridController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductGridScope>()!
        .notifier!;
  }

  static ProductGridController read(BuildContext context) {
    return context.getInheritedWidgetOfExactType<ProductGridScope>()!.notifier!;
  }
}
