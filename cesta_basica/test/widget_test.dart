// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cesta_basica/app/views/android/home/home.view.dart';
import 'package:cesta_basica/app/views/android/login/login.view.dart';
import 'package:cesta_basica/app/views/android/login/widgets/login.widget.textfield.dart';
import 'package:cesta_basica/app/views/android/splash/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Teste Widgets Page Splash", (tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashView()));
    expect(find.byType(SplashView), findsWidgets);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
    await tester.pumpAndSettle(Duration(seconds: 5));
    expect(find.byType(HomeView), findsWidgets);
  });

  testWidgets("Teste 02", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 03", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 04", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 05", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 06", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 07", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 08", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 09", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 10", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 11", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 12", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 13", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 14", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 15", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 16", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 17", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 18", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 19", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 20", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 21", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 22", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 23", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 24", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 25", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 26", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 27", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 28", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 29", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 30", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });

  testWidgets("Teste 31", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });

  testWidgets("Teste 32", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
  testWidgets("Teste 33", (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(LoginTextField), findsNWidgets(2));
  });
}
