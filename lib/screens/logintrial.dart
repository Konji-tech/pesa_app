import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF508248),
                Color(0xFF57C84D),
                Color(0xFF2EB62C),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Column(
                  children: <Widget>[
                    Text("Pesa App",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Image.asset("images/welcome.png",
                        fit: BoxFit.fitWidth, height: 340, width: 340),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Enter Name",
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Enter Password",
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none))),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90)),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          style:ButtonStyle(shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                    )),
                  ],
                ),
              ),
            )));
  }
}
