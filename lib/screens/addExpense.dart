import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class addExpense extends StatefulWidget {
  const addExpense({super.key});

  @override
  State<addExpense> createState() => _addExpenseState();
}

class _addExpenseState extends State<addExpense> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
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
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Image.asset("images/expense.png"),
                Padding(
                  padding: EdgeInsets.all(16),
                  //form
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Add Expense",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                       
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Expense'),
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (value) {
                           
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a Expense!';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Category'),
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (value) {
                            
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid Category!';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Amount'),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          onFieldSubmitted: (value) {
                            
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),


                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                       ElevatedButton(
                        
                          onPressed: () { },
                          style: ElevatedButton.styleFrom(
                            
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                    ),
                                    
                          ),
                          child: Text("Add Expense",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                                  )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
