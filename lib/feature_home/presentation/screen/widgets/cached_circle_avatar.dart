// ignore: public_member_api_docs
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  final String url;
  // ignore: public_member_api_docs, sort_constructors_first
  const CachedCircleAvatar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 20, backgroundImage: CachedNetworkImageProvider(url));
  }
}
