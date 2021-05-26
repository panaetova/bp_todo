import 'package:bp_todo/services/auth-services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleScreen;

  const RegisterScreen({Key key, this.toggleScreen}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);

    return Scaffold(
      backgroundColor: Color(0xFF55a3d6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor, width: 4)),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'D',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).primaryColor,
                        size: 44,
                      ),
                      Text(
                        ' APP',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (val) => val.isNotEmpty ? null : "Please enter an email address",
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white30),
                        hintText: "EMAIL",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54, width: 1),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: IconTheme(
                            data: IconThemeData(color: Theme.of(context).primaryColor),
                            child: Icon(Icons.email),
                          ),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (val) => val.length < 6 ? "Password must be more than 6 symbols" : null,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white30),
                        hintText: "PASSWORD",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54, width: 1),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: IconTheme(
                            data: IconThemeData(color: Theme.of(context).primaryColor),
                            child: Icon(Icons.vpn_key),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    height: 60,
                    minWidth: loginProvider.isLoading ? null : double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Color(0xFF55a3d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    splashColor: Color(0xFFcae6f9),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print("Email: ${_emailController.text}");
                        print("Password: ${_passwordController.text}");
                        await loginProvider.register(_emailController.text.trim(), _passwordController.text.trim());
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: loginProvider.isLoading ? CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.amberAccent),
                    ) :
                    Text("REGISTER", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),),
                    SizedBox(),
                    TextButton(
                        onPressed: () => widget.toggleScreen(),
                        child: Text(" Login!", style: TextStyle(fontSize: 18, color: Colors.amber),))
                  ],
                ),
                SizedBox(height: 20),
                if (loginProvider.errorMessage != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Text(loginProvider.errorMessage),
                      leading: Icon(Icons.error),
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => loginProvider.setMessage(null),
                      ),
                    )
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
