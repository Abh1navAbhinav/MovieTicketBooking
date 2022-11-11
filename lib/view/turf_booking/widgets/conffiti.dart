// import 'dart:math';

// import 'package:confetti/confetti.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ticket_booking/controller/booking_controller.dart';

// class PaymentStatus extends GetView<BookingController> {
//   const PaymentStatus({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<BookingController>(
//         builder: (controller) {
//           controller.isSuccess ? controller.afterPayment() : null;
//           return controller.isPaymentLoading.value
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Payment Processing...',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : ColoredBox(
//                   color: Colors.black,
//                   child: Stack(
//                     children: [
//                       ConfettiWidget(
//                         shouldLoop: false,
//                         confettiController: controller.confettiController,
//                         blastDirection: pi / 3,
//                         numberOfParticles: 60,
//                         blastDirectionality: BlastDirectionality.explosive,
//                         maxBlastForce: 20, // set a lower max blast force
//                         minBlastForce: 5, // set a lower min blast force
//                         emissionFrequency: 0.02,
//                         gravity: 0.02,
//                         colors: const [
//                           Colors.green,
//                           Colors.blue,
//                           Colors.pink,
//                           Colors.orange,
//                           Colors.purple,
//                           Colors.white,
//                         ],
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Payment Successful".toUpperCase(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//         },
//       ),
//     );
//   }
// }
