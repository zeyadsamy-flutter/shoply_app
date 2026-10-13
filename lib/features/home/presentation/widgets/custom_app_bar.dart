import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildActionIcon(
              icon: Icons.notifications_none_outlined,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _buildActionIcon(
              icon: Icons.shopping_bag_outlined,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionIcon({required IconData icon, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black87),
        onPressed: onTap,
      ),
    );
  }
}