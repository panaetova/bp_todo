import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  Widget logo() {
    return Padding(padding: EdgeInsets.only(top:120),
    child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('T', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
          SizedBox(width: 3,),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 4)),
          ),
          SizedBox(width: 3,),
          Text('D', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
          Icon(Icons.check_circle_outline, color: Theme.of(context).primaryColor, size: 44,),
          Text(' APP', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
        ],
      ),
    ),);
  }

  Widget input(Icon icon, String hint, TextEditingController controller, bool obscure) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
            )
        ),
      ),
    );
  }

  Widget button(String label, void func()) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Color(0xFF55a3d6),
      ),
      onPressed: () => func(),
      child: Text(label, style: TextStyle(
          fontWeight: FontWeight.bold, color: Color(0xFF55a3d6), fontSize: 20),),);
  }

  Widget form(String label, void func()) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 100),
            child: input(Icon(Icons.email), "EMAIL", _emailController, false)),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: input(Icon(Icons.lock), "PASSWORD", _passwordController, true),),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: button(label, func),
            ),
          )
        ],
      ),
    );
  }

  void _buttonAction() {
    _email = _emailController.text;
    _password = _passwordController.text;

    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF55a3d6),
      body: Column(
        children: <Widget>[
          logo(),
          showLogin
          ? Column(
            children: <Widget>[
              form('LOGIN', _buttonAction),
              Padding(padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: Text('Not registered yet? Register!', style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),),
                  onTap: () {
                    setState(() {
                      showLogin = false;
                    });
                  },
                ),)
            ],
          )
          : Column(
            children: <Widget>[
              form('REGISTER', _buttonAction),
              Padding(padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: Text('Already registered? Login!', style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),),
                  onTap: () {
                    setState(() {
                      showLogin = true;
                    });
                  },
                ),)
            ],
          ),
        ],
      ),
    );
  }
}
