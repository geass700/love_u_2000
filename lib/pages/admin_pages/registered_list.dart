import 'package:flutter/material.dart';
import 'package:love_u_2000/pages/admin_pages/edit_admin_page.dart';

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          child: InkWell(
            onTap: (){
              _submithandle();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('เว่ย เซ่าเทียน'),
            ),
          ),
        ),
      ],
    );
  }
  void _submithandle(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editAdminPage()),
    );

  }
  void _showSnackBar(String message,
      {int? durationSeconds, SnackBarAction? action}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: durationSeconds ?? 365 * 24 * 60 * 60),
        action: action,
      ),
    );
  }
}
