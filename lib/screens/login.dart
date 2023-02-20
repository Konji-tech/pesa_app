import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pesa_app/screens/openScreen.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const openScreen()));
                  },
                  icon: Icon(Icons.arrow_back))),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset("images/charts.png"),
          ),
          SizedBox(height: 15),
          Container(
            child: Column(
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text("Email Address"),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value != null) {
                                return 'Please Enter Your Email';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Enter Your Email',

                                // This is the normal border
                                border: OutlineInputBorder(),

                                // This is the error border
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 5))),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {},
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid password!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(labelText: 'Password',
                            border: OutlineInputBorder(),
                             errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 5))
                                        
                                        
                                        ),
                            
                          ),
                        ],
                      ),
                    ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
