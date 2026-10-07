import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: const [
        ProductCard(
          title: 'Essence Mascara Lash Princess',
          price: '\$9.99',
          rating: '2.6',
          imageUrl: 'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
        ),
        ProductCard(
          title: 'Eyeshadow Palette with Mirror',
          price: '\$19.99',
          rating: '2.9',
          imageUrl: 'https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png',
        ),
        ProductCard(
          title: 'Powder Canister',
          price: '\$14.99',
          rating: '4.6',
          imageUrl: 'https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/1.png',
        ),
        ProductCard(
          title: 'Red Lipstick',
          price: '\$12.99',
          rating: '4.4',
          imageUrl: 'https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/1.png',
        ),
      ],
    );
  }
}