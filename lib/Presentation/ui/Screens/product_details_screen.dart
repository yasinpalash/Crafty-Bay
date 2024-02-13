import 'package:flutter/material.dart';

import '../Widgets/productimagecarousel/product_image_carousel.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          ProductImageCarousel(),
        ],
      ),
    );
  }
}
