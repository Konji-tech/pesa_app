import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pesa_app/screens/welcome.dart';
import 'package:pesa_app/screens/addIncome.dart';


import '../widgets/expenseWidget.dart';


class income extends StatelessWidget {
  const income({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Income"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Color(0xFF41A317),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Text("Earned This Week",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green)),
                SizedBox(height: 15),
                Text("ksh 600",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    )),
                SizedBox(
                  height: 25,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    expenseWidget(
                        amount: " ksh 110",
                        category: "education",
                        img: "icons/book.png",
                        expenseName: "Exercise Book"),
                    expenseWidget(
                        amount: " ksh 50",
                        category: "phone",
                        img: "icons/chat.png",
                        expenseName: "Airtime"),
                    expenseWidget(
                        amount: " ksh 200",
                        category: "food",
                        img: "icons/fast-food.png",
                        expenseName: "Chips"),
                    expenseWidget(
                        amount: " ksh 130",
                        category: "transport",
                        img: "icons/vehicles.png",
                        expenseName: "Matatu"),
                    expenseWidget(
                        amount: " ksh 150",
                        category: "food",
                        img: "icons/vegetables.png",
                        expenseName: "Groceries"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const addIncome()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF41A317),
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const welcome()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(right: 90),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),

    );
  }
}