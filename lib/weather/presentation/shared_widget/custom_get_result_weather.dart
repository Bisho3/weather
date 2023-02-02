import 'package:flutter/material.dart';

class CustomResultGetWeather extends StatelessWidget {
  final String askText;
  final String answerText;
  const CustomResultGetWeather({Key? key,required this.askText,required this.answerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text(askText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Spacer(),
        Text(answerText,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
