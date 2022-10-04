import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CastGrid extends StatelessWidget {
  const CastGrid({
    Key? key,
    required this.actorName,
    required this.castName,
    required this.image,
  }) : super(key: key);
  final String image;
  final String actorName;
  final String castName;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      shadowColor: Colors.red,
      elevation: 5,
      child: SizedBox(
        height: 130,
        width: 80,
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    actorName,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    castName,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
