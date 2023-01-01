import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/widgets/drawer_widget.dart';

class UploadTask extends StatefulWidget {
  const UploadTask({super.key});

  @override
  State<UploadTask> createState() => _UploadTaskState();
}

class _UploadTaskState extends State<UploadTask> {
  TextEditingController _taskCategotyController =
      TextEditingController(text: "Choose Task category");
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  TextEditingController _deadLineDateController =
      TextEditingController(text: "Choose Task Deadline Date");
  final _formkey = GlobalKey<FormState>();
  DateTime? picked;

  @override
  void dispose() {
    // TODO: implement dispose
    _taskCategotyController.dispose();
    _taskTitleController.dispose();
    _taskDescriptionController.dispose();
    _deadLineDateController.dispose();
    super.dispose();
  }

  void _uploadTask() {
    if (_taskTitleController.text.isEmpty) {
      Flushbar(
        title: "Error",
        message: "Please fill in the Task title field",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context);
    } else {
      if (_taskDescriptionController.text.isEmpty) {
        Flushbar(
          title: "Error",
          message: "Please fill in the Task Description field",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context);
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Constants.darkblue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "All fields are required",
                      style: TextStyle(
                        color: Constants.darkblue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 1),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _textTitles(label: "Task category*"),
                            _textFormField(
                              controller: _taskCategotyController,
                              enabled: false,
                              maxlength: 100,
                              valueKey: "TaskCategory",
                              fnt: () {
                                _showTaskCategoryDialog(size: size);
                              },
                            ),
                            _textTitles(label: "Task title*"),
                            _textFormField(
                              controller: _taskTitleController,
                              enabled: true,
                              maxlength: 100,
                              valueKey: "Tasktitle",
                              fnt: () {},
                            ),
                            _textTitles(label: "Task Description*"),
                            _textFormField(
                              controller: _taskDescriptionController,
                              enabled: true,
                              maxlength: 1000,
                              valueKey: "TaskDescription",
                              fnt: () {},
                            ),
                            _textTitles(label: "Task Deadline Date*"),
                            _textFormField(
                              controller: _deadLineDateController,
                              enabled: false,
                              maxlength: 100,
                              valueKey: "TaskDeadline",
                              fnt: () {
                                _pickDateDialog();
                              },
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      color: Colors.purple,
                      onPressed: _uploadTask,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "Upload task",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.upload_file,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFormField({
    required String valueKey,
    required TextEditingController controller,
    required bool enabled,
    required Function fnt,
    required int maxlength,
  }) {
    return InkWell(
      onTap: () {
        fnt();
      },
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        maxLines: valueKey == "TaskDescription" ? 3 : 1,
        style: TextStyle(
          color: Constants.darkblue,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        key: ValueKey(valueKey),
        maxLength: maxlength,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
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
                        setState(() {
                          _taskCategotyController.text =
                              Constants.taskCategoryList[index];
                          Navigator.of(context).pop();
                        });
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
                child: Text("Cancel"),
              ),
            ],
          );
        }));
  }

  void _pickDateDialog() async {
    picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _deadLineDateController.text =
            "${picked!.year}-${picked!.month}-${picked!.day}";
      });
    }
  }

  Widget _textTitles({required String label}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.purple,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
