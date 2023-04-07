//ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';

class editAdminPage extends StatefulWidget {
  const editAdminPage({Key? key}) : super(key: key);

  @override
  State<editAdminPage> createState() => _editAdminPageState();
}

class _editAdminPageState extends State<editAdminPage> {

  var _status ='รอการประเมิน';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('ประเมินผู้เข้าร่วม',style: TextStyle(color: Colors.white),),
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
            child: Text('สถานะ: $_status'),

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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
                child: ElevatedButton(
                  onPressed: _passhandle,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('ผ่าน')
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
                child: ElevatedButton(
                  onPressed: _notpasshandle,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('ไม่ผ่าน'),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
  void _passhandle(){
    setState(() {
      _status = 'ผ่านกระประเมิน';
    });

  }
  void _notpasshandle(){
    setState(() {
      _status = 'ไม่ผ่านกระประเมิน';
    });

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

