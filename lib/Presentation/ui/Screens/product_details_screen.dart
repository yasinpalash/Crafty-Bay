import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../Utility/app_colors.dart';
import '../Widgets/productimagecarousel/product_image_carousel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  List<Color> colors = [
    Colors.black,
    Colors.amber,
    Colors.lightGreen,
    Colors.green,
    Colors.red
  ];
  Color _selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ProductImageCarousel(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Happy New Year Special Deal--- Save 30%',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: noOfItem,
                            builder: (context, value, _) {
                              return ItemCount(
                                initialValue: value,
                                minValue: 1,
                                maxValue: 20,
                                decimalPlaces: 0,
                                color: AppColors.primaryColor,
                                onChanged: (v) {
                                  noOfItem.value = v.toInt();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '4.4',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Reviews',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.favorite_outline_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      ColorSelector(
                        colors: colors,
                        onChange: (selectedColor) {
                          _selectedColor = selectedColor;
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          priceAndAddToCartSection,
        ],
      ),
    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              Text(
                '\$10000',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.colors, required this.onChange});
  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor;
  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.colors
          .map(
            (c) => InkWell(
              onTap: () {
                widget.onChange;
                _selectedColor = c;
                if (mounted) {
                  setState(() {});
                }
              },
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: c,
                  child: _selectedColor == c
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
