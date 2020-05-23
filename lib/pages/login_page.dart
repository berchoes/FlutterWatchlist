/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pwController = TextEditingController();
  final emailController = TextEditingController();
  String email = "b";
  String password = "1";
  SharedPreferences prefs;
  bool _isChecked = false;
  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    print(_isChecked);
    loadData();
  }

  void loadData() async {
    prefs = await SharedPreferences.getInstance();

    String email = prefs.getString("email");
    String password = prefs.getString("password");
    bool isChecked = prefs.getBool("isChecked");
    print(isChecked);

    emailController.text = email;
    pwController.text = password;

    if (isChecked == null) {
      _isChecked = false;
    } else {
      _isChecked = isChecked;
    }
    setState(() {});
  }

  void login() {
    if (emailController.text.isNotEmpty && pwController.text.isNotEmpty) {
      if (emailController.text == email && pwController.text == password) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Fluttertoast.showToast(
            msg: "Wrong Email or Password :(",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Fields cannot be Empty.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void saveInfo() async {
    prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", emailController.text);
    await prefs.setString("password", pwController.text);
    await prefs.setBool("isChecked", _isChecked);

    print(_isChecked);
    print(prefs.get("isChecked"));
  }

  void onChange(bool value) {
    if (value == true) {
      print("checked");
      setState(() {
        _isChecked = value;
        saveInfo();
      });
    } else {
      prefs.clear();
      setState(() {
        _isChecked = value;
      });
      print("deleted");
    }
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Movies",
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(
                height: 40.0,
              ),
              Theme(
                data: ThemeData(
                    primaryColor: Colors.red,
                    unselectedWidgetColor: Colors.grey),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.grey[300]),
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              buildTextField("Password"),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                        primaryColor: Colors.red,
                        unselectedWidgetColor: Colors.red),
                    child: Checkbox(
                      activeColor: Colors.red,
                      checkColor: Colors.white,
                      onChanged: (bool value) {
                        onChange(value);
                      },
                      value: _isChecked,
                    ),
                  ),
                  Text(
                    "Remember Me",
                    style: TextStyle(color: Colors.grey[300]),
                  )
                ],
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                onPressed: () {
                  login();
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20.0, color: Colors.grey[300]),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.red, unselectedWidgetColor: Colors.grey),
      child: TextField(
        controller: pwController,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.grey[300]),
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          prefixIcon: Icon(
            Icons.lock,
          ),
          suffixIcon: hintText == "Password"
              ? IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden
                      ? Icon(Icons.visibility_off)
                      : Icon(
                          Icons.visibility,
                        ),
                )
              : null,
        ),
        obscureText: hintText == "Password" ? _isHidden : false,
      ),
    );
  }
}*/
