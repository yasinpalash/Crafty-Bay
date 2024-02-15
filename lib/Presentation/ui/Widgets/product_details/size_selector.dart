import 'package:flutter/material.dart';

import '../../Utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});
  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;
  @override
  void initState() {
    super.initState();
    _selectedSize = widget.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.sizes
          .map(
            (c) => InkWell(
              onTap: () {
                widget.onChange;
                _selectedSize = c;
                if (mounted) {
                  setState(() {});
                }
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                    color: c == _selectedSize ? AppColors.primaryColor : null),
                child: Text(
                  c,
                  style: TextStyle(
                    color: c == _selectedSize ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
