import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  final curveAsset1 = 'assets/curve_1_1.svg';
  final curveAsset2 = 'assets/curve_1_2.svg';
  final curveAsset3a = 'assets/curve_1_3a.svg';
  final curveAsset3b = 'assets/curve_1_3b.svg';
  final buttonAsset = 'assets/right_button_1.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/curve_1_1.png',
              width: 171,
            ),
            // TODO: maybe it would be better to align these decorations to bottom-left?
            Positioned(
              left: 67,
              top: 624,
              child: Image.asset(
                'assets/curve_1_3a.png',
                width: 138,
              ),
            ),
            Positioned(
              left: 141,
              top: 624,
              child: Image.asset(
                'assets/curve_1_3b.png',
                width: 64,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/curve_1_2.png',
                width: 70,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 253),
                  OptionCard(
                      title: 'Track my period',
                      subtitle: 'contraception and wellbeing',
                      onTap: () {
                        log('Track my period - pressed');
                      }),
                  const SizedBox(height: 73),
                  OptionCard(
                      title: 'Get pregnant',
                      subtitle: 'learn about reproductive health',
                      onTap: () {
                        log('Get pregnant - pressed');
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap});

  final String title;
  final String subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343,
        height: 131,
        padding: EdgeInsets.fromLTRB(16, 31, 17, 0),
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
          Container(
            margin: const EdgeInsets.fromLTRB(0, 18, 0, 54), // 17, 49, 0, 54),
            child: Image.asset(
              'assets/arrow_right_1.png',
              width: 30,
            ),
          )
        ]),
      ),
    );
  }
}
