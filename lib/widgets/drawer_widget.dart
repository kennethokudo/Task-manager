import 'package:flutter/material.dart';
import 'package:flutter_application_6/all_workers.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/inner_screens/upload_task.dart';
import 'package:flutter_application_6/profile.dart';
import 'package:flutter_application_6/task_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "images/strawberry.jpg",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Work OS English",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Constants.darkblue,
                  ),
                )
              ],
            ),
          ),
          _listTiles(
            icon: Icons.task_outlined,
            label: "All Task",
            fnt: () {
              _navigateToAllTaskScreen(context);
            },
          ),
          _listTiles(
            icon: Icons.settings_outlined,
            label: "My Account",
            fnt: () {
              _navigateToProfileScreen(context);
            },
          ),
          _listTiles(
            icon: Icons.workspaces_outline,
            label: "Registered Workers",
            fnt: () {
              _navigateToAllWorkersScreen(context);
            },
          ),
          _listTiles(
            icon: Icons.add_task,
            label: "Add Task",
            fnt: () {
              _navigateToAddTaskScreen(context);
            },
          ),
          Divider(thickness: 2),
          _listTiles(
            icon: Icons.logout,
            label: "Logout",
            fnt: () {
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  void _navigateToProfileScreen(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Profile()));
  }

  void _navigateToAllWorkersScreen(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AllWorkers()));
  }

  void _navigateToAddTaskScreen(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const UploadTask()));
  }

  void _navigateToAllTaskScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskScreen()));
  }

  void _logout(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/logout.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Logout"),
                ),
              ],
            ),
            content: Text(
              "Do you want to sign out?",
              style: TextStyle(
                color: Constants.darkblue,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text("cancel"),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Ok",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles(
      {required IconData icon, required String label, required Function fnt}) {
    return ListTile(
      onTap: () {
        fnt();
      },
      leading: Icon(
        icon,
        color: Constants.darkblue,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Constants.darkblue,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
