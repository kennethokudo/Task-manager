import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/widgets/drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Card(
              margin: EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "My Name",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Job since joined date 2022-11-2",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Constants.darkblue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    Text(
                      "Contacts info",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Constants.darkblue,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child:
                          userinfo(title: "Email:", content: "kendo@gmail.com"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: userinfo(
                          title: "Phone Number:", content: "08044848484"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(thickness: 1),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _contactBy(
                          color: Colors.green,
                          icon: Icons.message_outlined,
                          fnt: () {
                            _openWhatsappChat();
                          },
                        ),
                        _contactBy(
                          color: Colors.red,
                          icon: Icons.mail_outlined,
                          fnt: () {
                            _mailTo();
                          },
                        ),
                        _contactBy(
                          color: Colors.purple,
                          icon: Icons.call_outlined,
                          fnt: () {
                            _callPhoneNumber();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 1),
                    SizedBox(height: 15),
                    Center(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 50,
                        color: Colors.purple,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.26,
                  width: size.width * 0.26,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 8,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      image: DecorationImage(
                          image: AssetImage("images/picture5.jpg"))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _openWhatsappChat() async {
    String phoneNumber = "08077645364";
    var url = "https://wa.me/$phoneNumber?text=Hello world";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Error occured";
    }
  }

  void _mailTo() async {
    String email = "kenny@gmail.com";
    var mailurl = "mailto:$email";
    if (await canLaunchUrlString(mailurl)) {
      await launchUrlString(mailurl);
    } else {
      throw "Error occured";
    }
  }

  void _callPhoneNumber() async {
    String phoneNumber = "+2348066860419";
    var url = "tel://$phoneNumber";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Error occured";
    }
  }

  Widget _contactBy(
      {required Function fnt, required Color color, required IconData icon}) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: color,
      child: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {
            fnt();
          },
          icon: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }

  Widget userinfo({required String title, required String content}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Constants.darkblue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Constants.darkblue,
            ),
          ),
        ),
      ],
    );
  }
}
