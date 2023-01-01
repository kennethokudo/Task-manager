import 'package:flutter/material.dart';
import 'package:flutter_application_6/Constants/constants.dart';
import 'package:flutter_application_6/widgets/drawer_widget.dart';
import 'package:flutter_application_6/widgets/task_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: Builder(builder: ((context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          );
        })),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Task",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showTaskCategoryDialog(size: size);
            },
            icon: Icon(
              Icons.filter_list_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        return TaskWidget();
      })),
    );
  }

  _showTaskCategoryDialog({required Size size}) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(
              "Task Category",
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.taskCategoryList.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        print(
                            "taskCategoryList[index],${Constants.taskCategoryList[index]}");
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Constants.taskCategoryList[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Constants.darkblue,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  })),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text("close"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Cancel filter"),
              ),
            ],
          );
        }));
  }
}
