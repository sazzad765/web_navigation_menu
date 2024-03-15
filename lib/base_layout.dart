import 'package:expandable_menu/menu_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        MenuLayout(),
      ]),
    );
  }
}
