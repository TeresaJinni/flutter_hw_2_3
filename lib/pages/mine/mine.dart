import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/G.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../../providers/user_provider.dart';

class Mine extends StatefulWidget {
  Mine({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  double iconSize = 20;
  final ImagePicker picker = ImagePicker();
  File? _image;
  Map userInfo = {};

  @override
  Widget build(BuildContext context) {
    var isLogin = context.read<UserProvider>().isLogin;
    if (isLogin) {
      // 已登录，获取用户信息
      userInfo = context.read<UserProvider>().userInfo;
    } else {
      // 未登录，跳转到登录页
      Future.delayed(Duration(milliseconds: 500), () {
        G.router.navigateTo(context, '/login');
      });
    }

    return Container(
      // color: Colors.amberAccent,
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _renderUserHeader(),
            _renderListMenu(),
            _renderProvider(),
          ]
        )
      )
    );
  }

  // 用户头部信息
  Widget _renderUserHeader() {

    Image _targetImage;

    if (_image != null) {
      _targetImage = FileImage(_image!, scale: 1) as Image;
    } else {
      if (userInfo.isNotEmpty) {
        _targetImage = Image.network(userInfo["avatar"].toString());
      } else {
        _targetImage = Image.asset("assets/flutter.jpg");
      }
    }

    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: InkWell(
          child: _image != null 
          ? 
          CircleAvatar(
            radius: 60,
            backgroundImage: FileImage(
              _image!,
              scale: 1
            ),
          )
          :
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              'assets/images/flutter.jpg'
            )
          ),
          onTap: () {
            showModalBottomSheet(
              context: context, 
              builder: (BuildContext context) {
                return renderBottomSheet(context);
              }
            );
          },
        )
      )
    );
  }

  // 渲染列表菜单
  Widget _renderListMenu() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.room_outlined, size: iconSize),
          title: Text('收获地址'),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () {
            G.router.navigateTo(context, '/address');
          },
        ),
        ListTile(
          leading: Icon(Icons.account_balance_outlined, size: iconSize),
          title: Text('账户余额'),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () {
            G.router.navigateTo(context, '/balance');
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline, size: iconSize),
          title: Text('联系客服'),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () {
            // G.router.navigateTo(context, '/provider_test');
          },
        ),
        ListTile(
          leading: Icon(Icons.star, size: iconSize),
          title: Text('发票管理'),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () {
            // G.router.navigateTo(context, '/provider_test');
          },
        ),
        ListTile(
          leading: Icon(Icons.login_outlined, size: iconSize),
          title: Text('退出'),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () async {
            // var res = await G.api.user.logout();
            // if (res == true) {
            //   // 清除状态中的用户数据
            //   context.read<UserProvider>().doLogout();

            //   // 跳转到 用户登录页
            //   G.router.navigateTo(context, '/login');
            //   return;
            // }
          },
        ),
      ],
    );
  }

  Widget renderBottomSheet(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _takePhoto();
              G.router.pop(context);
            },
            child: Container(
              child: Text('拍照'),
              height: 50,
              alignment: Alignment.center,
            )
          ),
          InkWell(
            onTap: () {
              _openGallery();
              G.router.pop(context);
            },
            child: Container(
              child: Text('从相册中选取'),
              height: 50,
              alignment: Alignment.center,
            )
          ),
          Container(
            color: Colors.grey[200],
            height: 10,
          ),
          InkWell(
            onTap: () {
              G.router.pop(context);
            },
            child: Container(
              child: Text('取消'),
              height: 50,
              alignment: Alignment.center,
            )
          )
        ],
      )
    );
  }

  // 拍照获取图片
  Future _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    
    // 图片选中后，才上传（如果未选中图片，则不作任何处理）
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _uploadImage(pickedFile);
      });
    } else {
      print('No Image');
    }
  }

  // 在相册中选取一张图片
  Future _openGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // 图片选中后，才上传（如果未选中图片，则不作任何处理）
    if (pickedFile != null) {
      print('test');  // TODO 可输出，OK，但是无法表示图片，有error
      setState(() {
        _image = File(pickedFile.path);
        _uploadImage(pickedFile);
      });
    } else {
      print('No Image');
    }
  }

  // 上传图片
  void _uploadImage(pickedFile) async {
    String fileName = pickedFile.path.split('/').last.toString();
    // String? suffix = fileName.split('.').last.toString();
    print(fileName);
    // var res = await G.api.public.uploadImage(pickedFile.path, fileName);
    // if (res['status'] == 200) {
    //   EasyLoading.showSuccess('上传成功');
    //   print('imageURL：'+res['data']['url']);
    //   _avatar = res['data']['url'];
    // }
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