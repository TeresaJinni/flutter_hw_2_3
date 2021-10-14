import 'package:flutter/material.dart';
import '../../pages/home/home_list_atom.dart';
import '../../utils/g.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<ShopAtom> _shopList = [];

  get shopAtom => null;

  Widget build(Object context) {
    return FutureBuilder (
        future: G.api.home.getShopList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator()
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center (
                    child: Text(
                        '${snapshot.error}',
                        style: TextStyle(color: Colors.red)
                    )
                );
              } else if (snapshot.hasData) {
                _shopList = snapshot.data as List<ShopAtom>;
                return SingleChildScrollView (
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var eachAtom in _shopList)
                          Container (
                            width: G.getWidthPercent(1 - CommonDefine.widgetEdgePercent * 2),
                            height: 100,
                            child: HomeListAtom(shopAtom: eachAtom),
                          )
                      ],
                    )
                );
              } else {
                return Center(
                    child: CircularProgressIndicator()
                );
              }
              break;
            default:
              return Container();
              break;
          }
        }
    );
  }
}
