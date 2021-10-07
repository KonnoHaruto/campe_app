import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'adding_page.dart';
import 'home_page.dart';
import 'setting_page.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
      onPressed: (){
          //code to execute on button press
      },
      child: const Icon(Icons.send), //icon inside button
  ),

  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  //floating action button position to center

  bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
    color:Colors.redAccent,
    shape: CircularNotchedRectangle(), //shape of notch
    notchMargin: 5, //notche margin between floating button and bottom appbar
    child: Row( //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {},),
        IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
        IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {},),
        IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {},),
      ],
    ),
  ),;
}