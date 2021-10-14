import 'package:flutter/material.dart';
import '../../utils/g.dart';


class Category1 extends StatefulWidget {
  Category1({Key? key}) : super(key: key);

  @override
  _Category1State createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 200,
            width: G.w() / 3,
          ),
        ]
      ),
    );
  }
}