// ignore: public_member_api_docs
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  // ignore: public_member_api_docs
  const Profile(
      {Key? key,
      required this.avatar,required this.avatar2})
      : super(key: key);

  final AssetImage avatar;
  final AssetImage avatar2;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      CircleAvatar(backgroundImage: avatar),
      CircleAvatar(backgroundImage: avatar2),
    ]);
  }
}
