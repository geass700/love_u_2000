//ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:love_u_2000/login/login_page.dart';
import 'package:love_u_2000/pages/user_pages/manage_page.dart';

class editPage extends StatefulWidget {
  const editPage({Key? key}) : super(key: key);

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {

  final _nameController = TextEditingController();
  //final _citizenIdController = TextEditingController();
  final _accountNumController = TextEditingController();
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();

    _idController.text = '113';
    _nameController.text = 'เว่ย เซ่าเทียน';
    _accountNumController.text = '1234567898765';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'แก้ไขข้อมูล',
          style: TextStyle(color: Colors.white),
        ),
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
              title: const Text('แสดงข้อมูล'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => managePage()),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อ',
              ),
              validator: (value) {
                if (value == null ) {
                  return 'ต้องกรอกชื่อ';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: TextFormField(
              controller: _accountNumController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'เลขที่บัญชี',
              ),
              validator: (value) {
                if (value == null ) {
                  return 'ต้องกรอกเลขที่บัญชี';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ใบเสร็จ'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
                child: ElevatedButton(
                  onPressed: null,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
                child: ElevatedButton(
                  onPressed: _submithandle,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('ยืมยัน'),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

  void _submithandle(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => managePage()),
    );
    _showSnackBar(
      'แก้ไขเรียบร้อย!',
      durationSeconds: 2,
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
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
