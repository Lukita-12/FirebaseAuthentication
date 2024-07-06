import 'package:auth_firebase/pages/signup/signup.dart';
import 'package:auth_firebase/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signup(context),
      appBar: AppBar(
        backgroundColor: Color(0xFFF99DBC),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: Icon(
                Icons.favorite_outlined,
                color: Color(0xFFFFFFFF),
                size: 30,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'OutFit',
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Color(0xFFFFFFFF),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.heart_broken,
                      color: Color(0xFFF99DBC),
                      size: 80,
                    ),
                    Text(
                      'WELLCOME',
                      style: TextStyle(
                        fontFamily: 'OutFit',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xFFF99DBC),
                      ),
                    ),
                    Text(
                      'Diaplikasi saya\n~Yapet Lukita~',
                      style: TextStyle(
                        fontFamily: 'OutFit',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFF99DBC),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _emailAddress(),
                    _password(),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _signin(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _emailAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Color(0xFFF99DBC),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF99DBC),
                width: 1,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF99DBC),
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF99DBC),
                width: 1,
              )
            ),
          ),
        )
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: true,
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Color(0xFFF99DBC),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF99DBC),
                width: 1,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF99DBC),
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF99DBC),
                width: 1,
              )
            ),
          ),
        )
      ],
    );
  }

  Widget _signin(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF99DBC)),
        elevation: MaterialStateProperty.all<double>(3),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 28),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.transparent, width: 1),
          ),
        ),
      ),
      onPressed: () async {
        await AuthService().signin(
          email: _emailController.text,
          password: _passwordController.text,
          context: context
        );
      },
      child: const Text(
        "Login",
        style: TextStyle(
          fontFamily: 'Readex Pro',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
                text: "Belum punya ",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 16
                ),
              ),
              TextSpan(
                text: "A-Kun?",
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 16,
                  color: Color(0xFFF99DBC),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFF99DBC),
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup()
                      ),
                    );
                  }
              ),
          ]
        )
      ),
    );
  }
}