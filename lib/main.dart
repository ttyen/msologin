import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomePage.dart';

const users = {
  'ttyen.james@gmail.com': '12345',
  'test': '12345',
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //email的控制器
  final emailController = TextEditingController();
  //密码的控制器
  final passwordController = TextEditingController();
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/flutter-logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: !_isHidden,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              // ignore: void_checks
              onPressed: () {
                // return true;
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                // ignore: void_checks
                onPressed: () {
                  String email = emailController.text.toString();
                  String password = passwordController.text.toString();
                  bool checkOk = true;
                  debugPrint(email);
                  debugPrint(password);
                  if (!users.containsKey(email)) {
                    checkOk = false;
                  }

                  if (users[email] != password) {
                    checkOk = false;
                    // return 'Password does not match';
                  }

                  if (!checkOk) {
                    Fluttertoast.showToast(
                      msg: "This Toast for wrong id & password !",
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.black,
                      backgroundColor: Colors.red,
                      fontSize: 16.0,
                    );
                    return 'ID | Password not match';
                  }
                  // if (users[data.name] != data.password) {
                  //   return 'Password does not match';
                  // }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            //const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
