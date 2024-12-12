import 'package:flutter/material.dart';


class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,

  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }
}
