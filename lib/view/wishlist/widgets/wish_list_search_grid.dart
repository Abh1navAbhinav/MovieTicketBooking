// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart';
// import 'package:ticket_booking/controller/wishlist_controller.dart';

// class WishListSearchGrid extends GetView<WishListController> {
//   const WishListSearchGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.custom(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverStairedGridDelegate(
//         crossAxisSpacing: 48,
//         mainAxisSpacing: 24,
//         startCrossAxisDirectionReversed: true,
//         pattern: [
//           const StairedGridTile(0.5, 1),
//           const StairedGridTile(0.5, 3 / 4),
//           const StairedGridTile(1.0, 10 / 4),
//         ],
//       ),
//       childrenDelegate: SliverChildBuilderDelegate(
//         childCount: controller.foundTurf.length,
//         (context, index) {
//           final data = controller.foundTurf[index];
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.white60,
//               image: DecorationImage(
//                 image: NetworkImage(
//                   data.turfLogo!,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//               border: Border.all(
//                 width: 2,
//                 color: Colors.black,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
