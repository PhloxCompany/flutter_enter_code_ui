import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';

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
            PhloxAnimations(
              duration: const Duration(
                milliseconds: 800,
              ),
              delay: const Duration(
                milliseconds: 1000
              ),
              fromY: -30,
              fromOpacity: 0,

              child: Lottie.asset('assets/lottie/enter_code.json',
                  width: 250, height: 250),
            ),
            const SizedBox(height: 50),
            PhloxAnimations(
              duration: const Duration(
                milliseconds: 800,
              ),
              delay: const Duration(
                  milliseconds: 1800
              ),
              fromY: -30,
              fromOpacity: 0,
              child: const Text(
                'Verification',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PhloxAnimations(
              duration: const Duration(
                milliseconds: 800,
              ),
              delay: const Duration(
                  milliseconds: 2000
              ),
              fromY: -30,
              fromOpacity: 0,
              child: const Text(
                'Please enter the 6 digit code sent \n +0945245664216',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            PhloxAnimations(
              duration: const Duration(
                milliseconds: 800,
              ),
              delay: const Duration(
                  milliseconds: 2500
              ),
              fromY: -30,
              fromOpacity: 0,
              child: VerificationCode(
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
            ),
            const SizedBox(height: 40),
            PhloxAnimations(
              duration: const Duration(
                milliseconds: 800,
              ),
              delay: const Duration(
                  milliseconds: 3000
              ),
              fromY: -30,
              fromOpacity: 0,
              child: Row(
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
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 46,
              child: PhloxAnimations(
                duration: const Duration(
                  milliseconds: 800,
                ),
                delay: const Duration(
                    milliseconds: 3500
                ),
                fromY: -30,
                fromOpacity: 0,
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
              ),
            )
          ],
        ),
      ),
    ));
  }
}
