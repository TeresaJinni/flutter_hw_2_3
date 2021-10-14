import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/g.dart';
import '../../providers/product_provider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../drawer.dart';
import 'home_big_button.dart';
import 'home_swiper.dart';
import 'home_shop.dart';
import 'home_list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  void initState() { 
    super.initState();
    
    // super.initState();
    G.api.home.getSlide().then((value) {
      print(value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      //  child: Text("home"),
      children: [
        HomeSwiper(),
        _renderProvider(),
        HomeShop()
      ]
    );
  }

    Widget _renderProvider() {
    // 获取状态模型中的数据
    var skuNum = Provider.of<ProductProvider>(context).skuNum;

    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // Provider.of<ProductProvider>(context).decrement();
              Provider.of<ProductProvider>(context, listen: false).decrement();
            }, 
            child: Text(
              '-',
              style: TextStyle(fontSize: 50),
            )
          ),
          Text(
            skuNum.toString(),
            style: TextStyle(fontSize: 50),
          ),

          ElevatedButton(
            onPressed: (){
              Provider.of<ProductProvider>(context, listen: false).increment();
            }, 
            child: Text(
              '+',
              style: TextStyle(fontSize: 50),
            )
          ),
        ],
      )
    );
  }

}