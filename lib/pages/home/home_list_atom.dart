import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/g.dart';

class HomeListAtom extends StatefulWidget {
  final ShopAtom shopAtom;

  @override
  _HomeListAtomState createState() => _HomeListAtomState();

  const HomeListAtom ({ Key? key, required this.shopAtom }): super(key: key);
}

class _HomeListAtomState extends State<HomeListAtom> {
  late final double _widgetEdge = G.getWidgetEdge();

  late final ButtonStyle buttonStyle = ElevatedButton.styleFrom (
      primary: Colors.white,
  );

  final TextStyle titleStyle = TextStyle (
      fontSize: 15,
      color: Colors.black
  );

  final TextStyle textStyleM = TextStyle (
      fontSize: 12,
      color: Colors.grey
  );

  final TextStyle textStyleS = TextStyle (
      fontSize: 10,
      color: Colors.lightBlue
  );

  final TextStyle textStyleNew = TextStyle (
      fontSize: 12,
      color: Colors.blue
  );

  final TextStyle textStylePremium = TextStyle (
      fontSize: 12,
      color: Colors.green
  );

  final TextStyle textStyleSale = TextStyle (
      fontSize: 12,
      color: Colors.red
  );

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Map<String, dynamic> p = {
          'detail': widget.shopAtom.rawData
        };
        G.router.navigateTo(context, "/detail" + G.parseQuery(params: p));
      },
      style: buttonStyle,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: G.getWidthPercent(0.25),
            padding: EdgeInsets.fromLTRB(_widgetEdge, _widgetEdge, 0, _widgetEdge),
            child: Image.network(widget.shopAtom.logo),
          ),
          Expanded (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(_widgetEdge, _widgetEdge, 0, 0),
                      height: titleStyle.height,
                      child: Wrap(
                        children: [
                          Text(widget.shopAtom.title, style: titleStyle)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(_widgetEdge, 0, 0, 0),
                      height: 25,
                      child: RatingBarIndicator(
                        rating: widget.shopAtom.rating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.lightBlue,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        itemPadding: EdgeInsets.zero,
                        unratedColor: Colors.amber.withAlpha(50),
                      )
                    ),
                    Container (
                        padding: EdgeInsets.fromLTRB(_widgetEdge, 0, 0, 0),
                        height: textStyleM.height,
                        child: Row(
                          children: [
                            Wrap (
                              alignment: WrapAlignment.start,
                              children: [
                                Text(
                                  widget.shopAtom.sale,
                                  style: textStyleM,
                                ),
                              ]
                            ),
                            SizedBox(width: 5),
                            Wrap (
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    widget.shopAtom.average,
                                    style: textStyleS,
                                  ),
                                ]
                            ),
                          ],
                        )
                    ),
                    Container (
                        padding: EdgeInsets.fromLTRB(_widgetEdge, 0, 0, 0),
                        height: textStyleM.height,
                        child: Row(
                          children: [
                            Wrap (
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    widget.shopAtom.minimum_order_amount.toString() + "元起送",
                                    style: textStyleM,
                                  ),
                                ]
                            ),
                            Wrap (
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    "/",
                                    style: textStyleM,
                                  ),
                                ]
                            ),
                            Wrap (
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    "配送费" + widget.shopAtom.delivery_fee.toString() + "元",
                                    style: textStyleM,
                                  ),
                                ]
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, _widgetEdge, 0, 0),
                      height: 50,
                      child: Row (
                        children: [
                          Text("", style: textStyleNew),
                          if (widget.shopAtom.is_new == 1)
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: textStyleNew.color!,
                                      width: 1.0,
                                    ),
                                ),
                                child: Text(" 新 ", style: textStyleNew)
                            ),
                          SizedBox(width: 5),
                          if (widget.shopAtom.is_premium == 1)
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: textStylePremium.color!,
                                    width: 1.0,
                                  ),
                                ),
                                child: Text(" 保准票 ", style: textStylePremium)
                            ),
                          SizedBox(width: 5),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: textStyleSale.color!,
                                  width: 1.0,
                                ),
                              ),
                              child: Text(" 优惠 ", style: textStyleSale)
                          ),
                        ],
                      ),
                    ),
                    Container (
                        height: 20,
                        child: Wrap (
                          alignment: WrapAlignment.start,
                          children: [
                            Text(
                              "距离" + widget.shopAtom.distance.toString() + "公里",
                              style: textStyleM,
                            ),
                          ]
                        ),
                    ),
                    Container (
                        height: 20,
                        child: Row (
                          children: [
                            Wrap (
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    "营业中: ",
                                    style: textStyleM,
                                  ),
                                ]
                            ),
                            Wrap (
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    widget.shopAtom.open.toString() + "-" + widget.shopAtom.close.toString(),
                                    style: textStyleM,
                                  ),
                                ]
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ]
            )
          ),
        ],
      ),
    );
  }
}
