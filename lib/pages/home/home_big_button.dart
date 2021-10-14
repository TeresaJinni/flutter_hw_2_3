import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/g.dart';

class HomeBigButton extends StatefulWidget {
  final double widgetHeight;

  @override
  _HomeBigButtonState createState() => _HomeBigButtonState();

  const HomeBigButton ({ Key? key, required this.widgetHeight }): super(key: key);
}

class _HomeBigButtonState extends State<HomeBigButton> {
  late final double _widgetEdge = G.getWidgetEdge();
  final double _iconSize = 35;

  late final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      primary: Colors.white,
      fixedSize: Size(G.getWidthPercent((1 - 8 * CommonDefine.widgetEdgePercent) / 4), widget.widgetHeight)
  );

  final TextStyle textStyle = TextStyle(
      fontSize: 15,
      color: Colors.black
  );

  Widget build(Object context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container (
            padding: EdgeInsets.all(_widgetEdge),
            child: ElevatedButton (
              onPressed: () {},
              style: buttonStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner, size: _iconSize, color: Colors.black),
                  Container(height: _widgetEdge),
                  Text(G.getLocalText('Scan'), style: textStyle)
                ],
              ),
            ),
          ),
          Container (
              padding: EdgeInsets.all(_widgetEdge),
              child: ElevatedButton (
                onPressed: () {},
                style: buttonStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payment, size: _iconSize, color: Colors.black),
                    Container(height: _widgetEdge),
                    Text(G.getLocalText('Pay'), style: textStyle)
                  ],
                ),
              ),
          ),
          Container (
              padding: EdgeInsets.all(_widgetEdge),
              child: ElevatedButton (
                onPressed: () {},
                style: buttonStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.savings_outlined, size: _iconSize, color: Colors.black),
                    Container(height: _widgetEdge),
                    Text(G.getLocalText('Get'), style: textStyle)
                  ],
                ),
              ),
          ),
          Container(
              padding: EdgeInsets.all(_widgetEdge),
              child: ElevatedButton (
                onPressed: () {},
                style: buttonStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome_mosaic_outlined, size: _iconSize, color: Colors.black),
                    Container(height: _widgetEdge),
                    Text(G.getLocalText('Card'), style: textStyle)
                  ],
                ),
            ),
         ),
      ],
    );

  }
}
