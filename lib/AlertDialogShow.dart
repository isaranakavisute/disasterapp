import 'package:flutter/material.dart';

class AlertDalogShow extends StatelessWidget {
  AlertDalogShow(
      {super.key,
      required this.description,
      required this.press,
      required this.title,
      required this.textButton});

  final String title;
  final String description;
  final VoidCallback press;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
      content: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: press,
            child: Text(
              textButton,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

//เพิ่มไดอะล็อก
class AlertDialogYesNo extends StatelessWidget {
  AlertDialogYesNo(
      {Key? key,
      required this.description,
      required this.pressYes,
      required this.title,
      required this.pressNo})
      : super(key: key);
  final String title, description;
  final VoidCallback pressYes;
  final VoidCallback pressNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          //textColor: Color(0xFF6200EE),
          onPressed: pressNo,
          child: Text('ยกเลิก'),
        ),
        TextButton(
          //textColor: Color(0xFF6200EE),
          onPressed: pressYes,
          child: Text('ตกลง'),
        ),
      ],
    );
  }
}

class AlertDialogYes extends StatelessWidget {
  AlertDialogYes(
      {Key? key,
      required this.description,
      required this.pressYes,
      required this.title})
      : super(key: key);
  final String title, description;
  final VoidCallback pressYes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
      actions: [
        Center(
          child: TextButton(
              //textColor: Color(0xFF6200EE),
              onPressed: pressYes,
              child: Text('ตกลง'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.grey))))),
        ),
      ],
    );
  }
}

class AlertDialogChangs extends StatelessWidget {
  AlertDialogChangs(
      {Key? key,
      required this.description,
      required this.pressYes,
      required this.title})
      : super(key: key);
  final String title, description;
  final VoidCallback pressYes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50))),
      content: Text(
        description,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
      ),
      actions: [
        Center(
          child: TextButton(
            //textColor: Color(0xFF6200EE),
            onPressed: pressYes,
            child: Text('ตกลง',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          ),
        ),
      ],
    );
  }
}
