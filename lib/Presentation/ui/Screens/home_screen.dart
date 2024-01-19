import 'package:flutter/material.dart';

import '../Utility/assets_path.dart';
import '../Widgets/home/circleiconbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Image.asset(AssetsPath.appBarLogo) ,
        actions: [
          CircleIconButton(
            onTap: (){
            },
            iconData: Icons.person,
          ),
          const SizedBox(width: 10,),
          CircleIconButton(
            onTap: (){
            },
            iconData: Icons.call,
          ),
          const SizedBox(width: 10,),
          CircleIconButton(
            onTap: (){
            },
            iconData: Icons.notifications_active,
          ),
        ],
      ),
    );
  }
}

