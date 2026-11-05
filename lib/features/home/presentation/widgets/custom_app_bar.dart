import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/product_scope.dart';

import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductScope.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Row(
              children: [
                Text(
                  'Good afternoon',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Text('✌️', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Shoply',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F1E36),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Stack(
              children: [
                CustomIconButton(
                  icon: Icons.notifications_none_outlined,
                  onTap: () {},
                ),
                Positioned(
                  right: 12,
                  top: 15,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Stack(
              children: [
                CustomIconButton(
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {},
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xFF00B074),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        controller.value.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
