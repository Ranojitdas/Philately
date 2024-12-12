import 'package:flutter/material.dart';
import 'package:philately/utils/device/device_utility.dart';


class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context)*0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}
