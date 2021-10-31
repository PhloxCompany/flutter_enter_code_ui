import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:lottie/lottie.dart';

class EnterCodeUi extends StatefulWidget {
  const EnterCodeUi({Key? key}) : super(key: key);

  @override
  _EnterCodeUiState createState() => _EnterCodeUiState();
}

bool edit = false;
late String code;
bool checkCode = false;

class _EnterCodeUiState extends State<EnterCodeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Lottie.asset('assets/lottie/enter_code.json',
                width: 250, height: 250),
            const SizedBox(height: 50),
            const Text(
              'Verification',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please enter the 6 digit code sent \n +0945245664216',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            VerificationCode(
              length: 6,
              keyboardType: TextInputType.number,
              underlineColor: Colors.black,
              onEditing: (bool value) {
                setState(() {
                  edit = value;
                });
              },
              onCompleted: (String value) {
                setState(() {
                  code = value;
                });
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Don't receive OTD?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Resent",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 46,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: MaterialButton(
                    color: Colors.grey[700],
                    onPressed: () {
                      if(checkCode == false){
                        setState(() {
                          checkCode = true;
                        });
                        return;
                      }
                      if(checkCode == true){
                        setState(() {
                          checkCode = false;
                        });
                        return;
                      }
                    },
                    child: checkCode == false
                        ? const Text(
                            "Verify",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
