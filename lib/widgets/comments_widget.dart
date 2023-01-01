import 'package:flutter/material.dart';
import 'package:flutter_application_6/Constants/constants.dart';

class CommentWidget extends StatelessWidget {
  CommentWidget({super.key});

  List<Color> _colors = [
    Colors.amber,
    Colors.orange,
    Colors.pink.shade200,
    Colors.brown,
    Colors.cyan,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    _colors.shuffle();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                border: Border.all(
                  color: _colors[0],
                  width: 2,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    "images/boss.png",
                  ),
                )),
          ),
        ),
        SizedBox(width: 10),
        Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kenneth Okudo",
                  style: TextStyle(
                    color: Constants.darkblue,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "we are done",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
