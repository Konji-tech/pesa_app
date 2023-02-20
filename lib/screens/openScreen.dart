import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pesa_app/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class openScreen extends StatelessWidget {
  const openScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text("Pesa App",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                    SizedBox(height: 25),
                    Image.asset(
                      "images/payments.png",
                      height: 300,
                      width: 300,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Best Way to Invest Your Money!",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const login()));
                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                        child: Text("Sign In",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold, fontSize: 15))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                        child: Text("Sign Up",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold, fontSize: 15))),
                  )
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