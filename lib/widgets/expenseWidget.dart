import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class expenseWidget extends StatelessWidget {
  const expenseWidget({
    Key? key,
    required this.amount,
    required this.category,
    required this.img,
    required this.expenseName,
  }) : super(key: key);

  final String category;
  final String img;
  final String expenseName;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color:  Colors.white,
      child: ListTile(
        title: Text(expenseName,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        subtitle: Text(category,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            )),
        leading: CircleAvatar(backgroundImage: AssetImage(img)),
        trailing: Text(amount,
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
    );
  }
}
