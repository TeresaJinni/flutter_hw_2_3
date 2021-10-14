import 'dart:convert';
import 'package:flutter/material.dart';
import '../../utils/g.dart';

class HomeDetail extends StatefulWidget {
  String? detail;
  HomeDetail({Key? key, required String this.detail}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  late ShopAtom shopAtom;
  late final double _widgetEdge = G.getWidgetEdge();

  late final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
  );

  final TextStyle titleStyle = TextStyle(
      fontSize: 15,
      color: Colors.black
  );

  final TextStyle textStyleM = TextStyle(
      fontSize: 12,
      color: Colors.grey
  );

  final TextStyle textStyleS = TextStyle(
      fontSize: 10,
      color: Colors.lightBlue
  );

  final TextStyle textStyleNew = TextStyle(
      fontSize: 12,
      color: Colors.blue
  );

  final TextStyle textStylePremium = TextStyle(
      fontSize: 12,
      color: Colors.green
  );

  final TextStyle textStyleSale = TextStyle(
      fontSize: 12,
      color: Colors.red
  );

  @override void initState() {
    super.initState();
    shopAtom = ShopAtom(json.decode(widget.detail!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Row(
                children: [
                  Container(
                    height: G.getWidthPercent(0.35),
                    padding: EdgeInsets.all(_widgetEdge),
                    child: Image.network(shopAtom.logo),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(_widgetEdge, _widgetEdge, 0, 0),
                    height: titleStyle.height,
                    child: Wrap(
                      children: [
                        Text(shopAtom.title, style: titleStyle)
                      ],
                    ),
                  ),
                ]
            )
        )
    );
  }
}