import 'package:flutter/material.dart';
import 'package:love_u_2000/login/login_page.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {

  final _nameController = TextEditingController();
  final _citizenIdController = TextEditingController();
  final _accountNumController = TextEditingController();
  //final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: TextFormField(
              controller: _citizenIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'รหัสประจำตัวประชาชน',
              ),
              validator: (value) {
                if (value == null ) {
                  return 'ต้องกรอกรหัสประจำตัวประชาชน';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'รหัสผ่าน',
              ),
              validator: (value) {
                if (value == null ) {
                  return 'ต้องกรอกรหัสผ่าน';
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
          )

        ],
      ),
    );
  }
  void _submithandle(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => loginPage()),
    );
    _showSnackBar(
      'ลงทะเบียนเรียบร้อย!',
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
