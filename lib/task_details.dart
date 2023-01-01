import 'package:flutter/material.dart';
import 'package:flutter_application_6/Constants/constants.dart';
import 'package:flutter_application_6/widgets/comments_widget.dart';

class TaskDetailsScreen extends StatefulWidget {
  TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  TextEditingController _descriptionController = TextEditingController();

  bool _iscommenting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Back",
            style: TextStyle(
              color: Constants.darkblue,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Human resources task",
              style: TextStyle(
                color: Constants.darkblue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Uploaded by",
                              style: TextStyle(
                                color: Constants.darkblue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3,
                                  color: Colors.purple,
                                ),
                                image: DecorationImage(
                                  image: AssetImage("images/boss.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Uploader name",
                                  style: TextStyle(
                                    color: Constants.darkblue,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "uploader job",
                                  style: TextStyle(
                                    color: Constants.darkblue,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Uploaded on:",
                              style: TextStyle(
                                color: Constants.darkblue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Date 2022-11-24",
                              style: TextStyle(
                                color: Constants.darkblue,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Deadline Date:",
                              style: TextStyle(
                                color: Constants.darkblue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Date 2022-12-24",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Deadline is not finished yet",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1),
                        SizedBox(height: 10),
                        Text(
                          "Done state:",
                          style: TextStyle(
                            color: Constants.darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  color: Constants.darkblue,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 1,
                              child: Icon(
                                Icons.check_box,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 40),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Not Done",
                                style: TextStyle(
                                  color: Constants.darkblue,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0,
                              child: Icon(
                                Icons.check_box,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1),
                        SizedBox(height: 10),
                        Text(
                          "Task Description:",
                          style: TextStyle(
                            color: Constants.darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Constants.darkblue,
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 30),
                        AnimatedSwitcher(
                          duration: Duration(
                            milliseconds: 500,
                          ),
                          child: _iscommenting
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: TextField(
                                        controller: _descriptionController,
                                        style: TextStyle(
                                          color: Constants.darkblue,
                                        ),
                                        maxLength: 200,
                                        maxLines: 6,
                                        decoration: InputDecoration(
                                            fillColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            filled: true,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.purple,
                                            ))),
                                      ),
                                    ),
                                    Flexible(
                                        child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MaterialButton(
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            color: Colors.purple,
                                            child: Text("Post"),
                                            textColor: Colors.white,
                                            elevation: 0,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _iscommenting = !_iscommenting;
                                              });
                                            },
                                            child: Text(
                                              "Cancel",
                                            ))
                                      ],
                                    ))
                                  ],
                                )
                              : Center(
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        _iscommenting = !_iscommenting;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.purple,
                                    child: Text("Add a comment"),
                                    textColor: Colors.white,
                                    elevation: 0,
                                  ),
                                ),
                        ),
                        SizedBox(height: 40),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return CommentWidget();
                            }),
                            separatorBuilder: ((context, index) {
                              return Divider(
                                thickness: 1,
                              );
                            }),
                            itemCount: 15)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
