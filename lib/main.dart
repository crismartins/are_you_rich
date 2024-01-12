import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Are you Rich?',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.fredoka(
            fontSize: 20.0,
          ),
          titleLarge: GoogleFonts.fredoka(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 4.0,
          ),
          labelLarge: GoogleFonts.fredoka(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: kButtonColor,
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Colors.transparent,
          scrolledUnderElevation: 0.0,
          elevation: 0,
        ),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        QuizScreen.id: (context) => QuizScreen(),
      },
    );
  }
}
