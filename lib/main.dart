import 'package:flc_test_task/ui/choice_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    var baseTheme = ThemeData();
    return MaterialApp(
      title: 'Flora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF53538A)),
        useMaterial3: true,
      ),
      home: const ChoicePage(),
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