import 'package:auth_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                Icons.heart_broken,
                color: Color(0xFFFFFFFF),
                size: 30,
              ),
            ),
            Text(
              'Home',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 32),
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
                      Icons.heart_broken_sharp,
                      color: Color(0xFFF99DBC),
                      size: 80,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'Yapet Lukita\n21041052',
                        style: TextStyle(
                          fontFamily: 'OutFit',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFFF99DBC),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Selamat anda telah berhasil login...❤',
                              style: TextStyle(
                                color: Color(0xFFF99DBC),
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              ),
                            ),
                            Text(
                              FirebaseAuth.instance.currentUser!.email!.toString(),
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                  color: Color(0xFFF99DBC),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _logout(context),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color> (Color(0xFFF99DBC)),
        elevation: MaterialStateProperty.all<double>(3),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry> (
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
        await AuthService().signout(context: context);
      },
      child: Text(
        'Logout',
        style: TextStyle(
          fontFamily: 'Readex Pro',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}