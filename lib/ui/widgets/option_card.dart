import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(
      {super.key,
      required this.title,
      required this.subtitle,
      this.onTap,
      this.showArrow = true});

  final String title;
  final String subtitle;
  final Function()? onTap;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343,
        height: 131,
        padding: const EdgeInsets.fromLTRB(16, 31, 17, 0),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFEFEF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              )
            ]),
          ),
          if (showArrow)
            Container(
              margin:
                  const EdgeInsets.fromLTRB(0, 18, 0, 54), // 17, 49, 0, 54),
              child: Image.asset(
                'assets/arrow_right_dark.png',
                width: 30,
              ),
            )
        ]),
      ),
    );
  }
}
