import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key? key,
    required this.onClick,
    required this.img,
    required this.inkTitle,
  }) : super(key: key);

  final VoidCallback onClick;
  final String img;
  final String inkTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: InkWell(
          onTap: onClick,
          child: Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: Color(0xFF41A317),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    img,
                    fit: BoxFit.fitHeight,
                    width: 150,
                    alignment: Alignment.centerLeft,
                  ),
                  Text(inkTitle,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white))
                ]),
          )),
    );
  }
}
