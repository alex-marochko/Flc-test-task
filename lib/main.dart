import 'package:flc_test_task/app/main_cubit.dart';
import 'package:flc_test_task/ui/birth_date_page.dart';
import 'package:flc_test_task/ui/choice_page.dart';
import 'package:flc_test_task/ui/loading_page.dart';
import 'package:flc_test_task/ui/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MaterialApp(
        title: 'Flora',
        theme: ThemeData(
          useMaterial3: true,
        ),
        // home: ResultPage(), //BirthDatePage(), //const ChoicePage(),
        routes: {
          LoadingPage.routeName: (context) => LoadingPage(),
          ChoicePage.routeName: (context) => ChoicePage(),
          BirthDatePage.routeName: (context) => BirthDatePage(),
          ResultPage.routeName: (context) => ResultPage()
        },
        initialRoute: LoadingPage.routeName,
      ),
    );
  }
}

void init() {
  // We have necessary font in assets
  GoogleFonts.config.allowRuntimeFetching = false;

  // Licensing Fonts
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
