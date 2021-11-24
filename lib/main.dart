import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:tako/provider/navmanager.dart';
import 'package:tako/provider/tabmanager.dart';
import 'package:tako/screens/main_screen.dart';
import 'package:tako/theme/tako_theme.dart';

void main() {
  _setUpLogging();
  runApp(const MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabManager()),
        ChangeNotifierProvider(create: (_) => NavManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: TakoTheme.dark(),
        home: const MainScreen(),
      ),
    );
  }
}
