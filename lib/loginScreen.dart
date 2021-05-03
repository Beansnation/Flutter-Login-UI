import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "WELCOME BACK",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 6,
            fontSize: 11,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 6))
              ]),
          height: 60.0,
          width: 366.0,
          child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(top: 16.0, left: 24.0, bottom: 14.0),
                  hintText: "Email address",
                  filled: true,
                  // labelText: "Email address",
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  )),
              autofillHints: [AutofillHints.email],
              validator: (String email)
                  //return null if valid
                  //otherwise string with the error message if invalid
                  =>
                  email != null && !EmailValidator.validate(email)
                      ? "Please enter a valid email"
                      : null
              ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 24.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 6))
              ]),
          height: 60.0,
          width: 366.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(top: 16.0, left: 24.0, bottom: 14.0),
                hintText: "Password",
                // labelText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            validator: (String password) {
              if (password.length < 4) {
                return "Password must be at leaast 4 characters";
              }
            },
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        width: 366.0,
        height: 60.0,
        child: ElevatedButton(
          onPressed: () => _formKey.currentState.validate(),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(6.0),
              backgroundColor: MaterialStateProperty.all(
                  Color(0xff4A80F0).withOpacity(0.2))),
          child: Text(
            "Sign in",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget forgotpword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff121421),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 104),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 104),
                  buildEmail(),
                  SizedBox(height: 10),
                  buildPassword(),
                  SizedBox(height: 10),
                  forgotpword(),
                  SizedBox(height: 40),
                  buildLoginBtn(),
                  SizedBox(height: 10),
                  Text(
                    "Reset Password",
                    style: TextStyle(color: Color(0xff4A80F0)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
