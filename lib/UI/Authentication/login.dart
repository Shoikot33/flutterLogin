import 'package:flutter/material.dart';
import "./verification.dart";
class Login extends StatelessWidget {

 int _counter = 0;
  String titleInput = '';
  String _mobile = '';
  var _formKey = GlobalKey<FormState>();

 

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return "Mobile Number must be of 10 digit";
    else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  'images/Logo.png',
                  width: 170,
                  height: 43,
                ),
              ),
              const SizedBox(height: 27),
              Text("লগ ইন করুন", style: Theme.of(context).textTheme.headline1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'মোবাইল নাম্বার',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      int length = value.toString().length;

                      if (!RegExp('^[0-9]*\$').hasMatch(value!)) {
                        return "মোবাইল নাম্বারটি সঠিক নয়";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _mobile = value.toString();
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // final snakBar = SnackBar(content: Text("Submitting Form "));

            // _scaffoldKey.currentState!.showSnackBar(snakBar);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OtpVerification()));
          }
        },
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward,color: Colors.white,),
        disabledElevation: 0.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}