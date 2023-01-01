import 'package:flutter/material.dart';
import 'package:flutter_application_6/Constants/constants.dart';
import 'package:flutter_application_6/widgets/all_workers_widget.dart';
import 'package:flutter_application_6/widgets/drawer_widget.dart';
import 'package:flutter_application_6/widgets/task_widget.dart';

class AllWorkers extends StatefulWidget {
  const AllWorkers({super.key});

  @override
  State<AllWorkers> createState() => _AllWorkersState();
}

class _AllWorkersState extends State<AllWorkers> {
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
          "All Workers",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        return AllWorkersWidget();
      })),
    );
  }
}
