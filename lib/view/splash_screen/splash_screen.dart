/* 

import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final colorsobj = Colours();
  @override
  void initState() {
    checkUserLoggedIn();

    CategoryDb.instance.refreshUi();
    TransactionDb.instance.refresh();
    getUserName();

    super.initState();
  }

  final obj = Widgets();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: colorsobj.colorsearch(),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: Image(
                image:
                    AssetImage('assets/images/splashscreen/Piggy bank 1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> goToSignIn() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    Get.off(
      () => const SigninPage(),
      transition: Transition.fade,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userloggedin = sharedpref.getBool(saveKeyName);
    if (userloggedin == null || userloggedin == false) {
      goToSignIn();
    } else {
      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
      Get.off(
        () => const BottomNav(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 800,
        ),
      );
    }
  }
}
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/global_constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantObj.kColor10,
      body: Center(
        child: Text(
          'Splash screen',
          style: GoogleFonts.aladin(
            fontSize: 70,
            fontWeight: FontWeight.bold,
            color: constantObj.kColor40,
          ),
        ),
      ),
    );
  }
}
