import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../../Utility/app_colors.dart';
import '../../Utility/assets_path.dart';
class CardProductItem extends StatefulWidget {
  const CardProductItem({super.key});
  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeJpg,
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Nike shoe mk231 fdtgruysdfsfds',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Row(
                            children: [
                              Text(
                                'Color:red,',
                                style: TextStyle(color: Colors.black54),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Size:XL',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$100',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                    ValueListenableBuilder(
                      valueListenable: noOfItems,
                      builder: (context, value, _) {
                        return ItemCount(
                          initialValue: value,
                          minValue: 1,
                          maxValue: 20,
                          decimalPlaces: 0,
                          step: 1,
                          color: AppColors.primaryColor,
                          onChanged: (v) {
                            noOfItems.value = v.toInt();
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
