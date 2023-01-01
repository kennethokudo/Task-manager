import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';

class AllWorkersWidget extends StatefulWidget {
  const AllWorkersWidget({super.key});

  @override
  State<AllWorkersWidget> createState() => _AllWorkersWidgetState();
}

class _AllWorkersWidgetState extends State<AllWorkersWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: ListTile(
          onTap: () {},
          onLongPress: () {},
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          leading: Container(
            padding: EdgeInsets.only(
              right: 20,
            ),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
              color: Colors.black,
              width: 1,
            ))),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset(
                "images/picture5.jpg",
                height: 50,
                width: 50,
              ),
            ),
          ),
          title: Text(
            "Worker name",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Constants.darkblue,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.linear_scale_outlined,
                color: Colors.purple,
              ),
              Text(
                "Position/08066865476",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mail_outline,
                size: 30,
              ))),
    );
  }
}
