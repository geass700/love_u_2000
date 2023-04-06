//ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:love_u_2000/pages/manage_page.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  var _feedbacktext = '';
  @override
  void initState() {
    super.initState();

    _idController.text = '113';
    _passwordController.text = '1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                  'ช่วยท่านลดภาระค่าใช้จ่ายด้านการศึกษา จากใจ พรรคกระยาจก'),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/hat.jpg', height: 140.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: TextFormField(
                      controller: _idController,
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
                        if (value == null || value.isEmpty) {
                          return 'ต้องกรอกรหัสผ่าน';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
                    child: ElevatedButton(
                      onPressed: _handleClickLogin,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('LOGIN'),
                      ),
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(_feedbacktext)),
                  ),*/
                ],
              ))
        ],
      ),
    );
  }
  void _handleClickLogin(){
    var idcheck = _idController.text;
    var passwordcheck = _passwordController.text;
    if(idcheck == '113' && passwordcheck == '1234'){
      /*setState(() {
        _feedbacktext = 'hi boi';
      });
      */
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => managePage()),
      );
      _showSnackBar(
        'Hi, $idcheck',
        durationSeconds: 2,
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
        ),
      );
    }
    else{
      _showSnackBar(
        'รหัสประจำตัวหรือรหัสผ่านผิด',
        durationSeconds: 2,
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
        ),
      );
    }

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
