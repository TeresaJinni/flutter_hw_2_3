import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../../utils/g.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer ({Key? key}): super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Map userInfo = {};

  double iconSize = 20;

  @override
  Widget build(BuildContext context) {
    var isLogin = context.read<UserProvider>().isLogin;
    if (isLogin) {
      userInfo = context.read<UserProvider>().userInfo;
    }

    var targetImage;
    if (userInfo.isNotEmpty) {
      targetImage = Image.network(userInfo["avatar"].toString());
    } else {
      targetImage = Image.asset("assets/flutter.jpg");
    }

    return ListView (
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue
          ),
          child: CircleAvatar (
            radius: 60,
            backgroundImage: targetImage.image,
          ),
        ),
        ListTile(
          leading: Icon(Icons.verified_user, size: iconSize),
          title: Text("用户名：" + (userInfo.isNotEmpty ? userInfo["username"].toString() : "-")),
        ),
        ListTile(
          leading: Icon(Icons.email, size: iconSize),
          title: Text("E-Mail：" + (userInfo.isNotEmpty ? userInfo["email"].toString() : "-")),
        ),
        ListTile(
          leading: Icon((userInfo.isNotEmpty ? Icons.logout: Icons.login), size: iconSize),
          title: Text((userInfo.isNotEmpty ? '退出' : '登陆')),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () async {
            context.read<UserProvider>().logout();
            G.router.navigateTo(context, '/login');
          },
        ),
      ],
    );
  }

}