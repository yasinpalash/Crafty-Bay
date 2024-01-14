import 'package:flutter/material.dart';

class WishListsScreen extends StatefulWidget {
  const WishListsScreen({super.key});

  @override
  State<WishListsScreen> createState() => _WishListsScreenState();
}

class _WishListsScreenState extends State<WishListsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wish'),
      ),
    );
  }
}
