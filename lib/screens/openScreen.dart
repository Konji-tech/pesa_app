import 'package:flutter/material.dart';

import 'package:pesa_app/screens/login.dart';
import 'package:pesa_app/screens/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class openScreen extends StatelessWidget {
  const openScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
             gradient: LinearGradient(colors: [
                  Color(0xFF508248),
                  Color(0xFF57C84D),
                  Color(0xFF2EB62C),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          
          
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 35),
              
              Text(
                "JIPANGE",
                style: GoogleFonts.nunito(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
                textAlign: TextAlign.center,
              ),
              
              Image.asset(
                "images/welcome2.png",
                height: height * 0.6,
              ),
              Column(
                children: [
                  Text(
                    "MANAGE YOUR FINANCES",
                    style: GoogleFonts.nunito(
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Keep track of what you spend on the go! Daily,weekly and even monthly",
                    style: GoogleFonts.nunito(color:  Colors.white,fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Login()));},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            foregroundColor: Color(0xFFFFFFFF),
                            backgroundColor: Color(0xFF183b25),
                            side: BorderSide(color: Color(0xFF272727)),
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          child: Text("Sign in"))),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const signup()));},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            foregroundColor: Color(0xFF272727),
                            backgroundColor: Colors.black,
                            side: BorderSide(color: Color(0xFF272727)),
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          child: Text("Sign Up",style: TextStyle(color: Colors.white),))),
                ],
              )
            ],
          ),
        ),
      ),
    );
    
    
  }
}


//