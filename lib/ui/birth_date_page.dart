import 'dart:developer';

import 'package:flc_test_task/app/main_cubit.dart';
import 'package:flc_test_task/ui/tools/custom_page.dart';
import 'package:flc_test_task/ui/widgets/decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthDatePage extends StatefulWidget {
  const BirthDatePage({super.key});

  static Page page() {
    return const CustomPage<void>(
      child: BirthDatePage(),
    );
  }

  @override
  State<BirthDatePage> createState() => _BirthDatePageState();
}

class _BirthDatePageState extends State<BirthDatePage> {
  int _selectedYear = 2005;
  final List<int> _years = List.generate(100, (index) => 1915 + index);
  final List<Widget> _yearsLabels = List.generate(
      100,
      (index) => Text(
            (1915 + index).toString(),
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w900,
                height: 1,
              ),
            ),
          ));

  final _scrollController = FixedExtentScrollController(initialItem: 90);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<MainCubit>().selectMode(null);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              ...decorations,
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Log in your date of birth',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),
                    SizedBox(
                      height: 300,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 67,
                              width: 355,
                              margin: const EdgeInsets.only(bottom: 26),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFFF6F6F6),
                              ),
                            ),
                          ),
                          ListWheelScrollView(
                            itemExtent: 67,
                            controller: _scrollController,
                            physics: const FixedExtentScrollPhysics(),
                            squeeze: 0.9,
                            onSelectedItemChanged: (item) {
                              _selectedYear = _years[item];
                            },
                            children: _yearsLabels,
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: IgnorePointer(
                                child: Container(
                                  height: 104,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0x60FFFFFF),
                                      Color(0xFFFFFFFF)
                                    ],
                                  )),
                                ),
                              )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: IgnorePointer(
                              child: Container(
                                height: 129,
                                width: 100,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x60FFFFFF),
                                    Color(0xFFFFFFFF)
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 140),
                    SizedBox(
                      width: 189,
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          log('selected year: $_selectedYear');
                          context.read<MainCubit>().selectYear(_selectedYear);
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 189,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF3E3D74),
                                          Color(0xFF8282A7)
                                        ])),
                              ),
                            ),
                            Positioned(
                              left: 68,
                              top: 11,
                              child: SizedBox(
                                width: 55,
                                height: 37,
                                child: Text(
                                  'Next',
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 145,
                              top: 11,
                              child: Container(
                                width: 27,
                                height: 27,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: Stack(children: [
                                  Image.asset('assets/arrow_right_light.png',
                                      width: 27)
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
