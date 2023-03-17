import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pesa_app/widgets/welcomeWidget.dart';
import 'package:pesa_app/screens/expenses.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                    ),
                    color: Color(0xFF41A317)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 80,
                      left: 0,
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 115,
                      left: 20,
                      child: Text("Welcome Konji",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                  ],
                )),
            SizedBox(
              height: 20.0,
            ),
            WelcomeWidget(
                onClick: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Expenses()));
                }),
                img: "images/savings2.png",
                inkTitle: "income"),
            WelcomeWidget(
                onClick: (() {}),
                img: "images/savings.png",
                inkTitle: "Savings"),
            WelcomeWidget(
                onClick: (() {}), img: "images/charts.png", inkTitle: "budget"),
            WelcomeWidget(
                onClick: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Expenses()));
                }),
                img: "images/printing.png",
                inkTitle: "Expenses"),
          ],
        ),
      ),
    );
  }
}
