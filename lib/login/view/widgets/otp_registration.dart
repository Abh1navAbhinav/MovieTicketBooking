import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:ticket_booking/login/controllers/login_controller.dart';
import 'package:ticket_booking/main.dart';

class OtpRegistration extends GetView<LoginController> {
  const OtpRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 15,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.blue,
            child: AnimatedContainer(
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.easeIn,
              height: 230,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kColor2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Enter the OTP Below to verify your Mobile Number',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.anekOdia(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Form(
                    key: controller.otpFormkey,
                    child: Pinput(
                      length: 4,
                      controller: controller.otpSignUpController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "OTP is required";
                        }

                        if (value.length != 4) {
                          return 'Invalid OTP';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          "   Mobile Number: ${controller.signUPMobileController.text}"),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  controller.isOTpRegistration.value = true;
                  // controller.buttonValue.value = 'Login';
                },
                child: Text(
                  'Change Mobile number',
                  style: ktextStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  // controller.isOTpRegistration.value = true;
                  // controller.buttonValue.value = 'Login';
                },
                child: Text(
                  'Resend OTP!',
                  style: ktextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
