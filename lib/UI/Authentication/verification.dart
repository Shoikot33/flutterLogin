import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() =>
      _OtpVerificationState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class _OtpVerificationState extends State<OtpVerification> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(253, 154, 38, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),backgroundColor: Colors.white,elevation: 0,),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'images/Logo.png',
                  width: 170,
                  height: 43,
                ),
              ),
              const SizedBox(height: 60,),
              Center(
                child: Text("Enter verification code that was sent to 01312121123",textAlign: TextAlign.center,),
              ),
            Container(
              padding: EdgeInsets.all(20),
              child: Pinput(
                controller: pinController,
                focusNode: focusNode,
                length: 6,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                onClipboardFound: (value) {
                  debugPrint('onClipboardFound: $value');
                  pinController.setText(value);
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin)=>print(pin),
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if (_formKey.currentState!.validate()) {
          //   // final snakBar = SnackBar(content: Text("Submitting Form "));

          //   // _scaffoldKey.currentState!.showSnackBar(snakBar);
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => OtpVerification()));
          // }
        },
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward,color: Colors.white,),
        disabledElevation: 0.0,
      ), // This 
    );
  }
}