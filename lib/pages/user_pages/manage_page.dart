//ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:love_u_2000/login/login_page.dart';
import 'package:love_u_2000/pages/user_pages/edit_page.dart';

class managePage extends StatefulWidget {
  const managePage({Key? key}) : super(key: key);

  @override
  State<managePage> createState() => _managePageState();
}

class _managePageState extends State<managePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('ข้อมูลที่ลงทะเบียน',style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'ระบบลงทะเบียนออนไลน์',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('ออกจากระบบ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                );
                _showSnackBar(
                  'ออกจากระบบแล้ว',
                  durationSeconds: 1,

                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_note_outlined),
              title: const Text('แก้ไขข้อมูล'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => editPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('นาย เว่ย  เซ่าเทียน'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('สถานะ: ผ่านการประเมิน'),
            
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('เลขที่บัญชี: 1234567898765'),
          ),
          Row(
            children: [
              Text('ใบเสร็จที่ส่ง'),
              Image.asset('assets/images/bill.png', height: 140.0),
            ],
          )
        ],
      ),
    );
  }
  void _showSnackBar(String message, {int? durationSeconds, SnackBarAction? action}) {
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
