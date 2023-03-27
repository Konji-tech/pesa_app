import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:pesa_app/controller/auth_controller.dart';
import 'package:pesa_app/screens/welcome.dart';
import 'package:pesa_app/screens/openScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesa_app/utils/utils.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();
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
                    Text("JIPANGE",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Image.asset("images/idk.png",
                        fit: BoxFit.fitWidth, height: 340, width: 340),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: false,
                      controller: fnameController,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "First Name ",
                          labelStyle: TextStyle(color: Colors.black),
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
                      controller: lnameController,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Enter Last Name",
                          labelStyle: TextStyle(color: Colors.black),
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
                      controller: emailController,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Email ",
                          labelStyle: TextStyle(color: Colors.black),
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
                      controller: phoneController,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Enter Phone Number",
                          labelStyle: TextStyle(color: Colors.black),
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
                      obscureText: true,
                      controller: passwordController,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Password ",
                          labelStyle: TextStyle(color: Colors.black),
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
                      controller: repeatpasswordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Re-enter password ",
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none))),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90)),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (emailController.text.trim().isEmpty ||
                                fnameController.text.trim().isEmpty ||
                                lnameController.text.trim().isEmpty ||
                                phoneController.text.trim().isEmpty ||
                                passwordController.text.trim().isEmpty ||
                                repeatpasswordController.text.trim().isEmpty) {
                              Utils.showError("No field should be empty");
                            } else if (passwordController.text.trim() !=
                                repeatpasswordController.text.trim()) {
                              Utils.showError("Passwords do not match");
                            } else {
                              await
                              AuthController.to.register(
                                  fnameController.text.trim(),
                                  lnameController.text.trim(),
                                  emailController.text.trim(),
                                  phoneController.text.trim(),
                                  "",
                                  "",
                                  passwordController.text.trim());
                                 
                            }
                            
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          child: Text("Sign Up",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        )),
                  ],
                ),
              ),
            )));
  }
}
