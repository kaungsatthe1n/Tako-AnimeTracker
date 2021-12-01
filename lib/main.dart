import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import './provider/connectivitymanager.dart';
import './provider/navmanager.dart';
import './provider/tabmanager.dart';
import './screens/splash_screen.dart';
import './services/anime_service.dart';
import './theme/tako_theme.dart';

void main() {
  _setUpLogging();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
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
        ChangeNotifierProvider(create: (_) => ConnectivityManager()),
        Provider(
          create: (_) => AnimeService.create(),
          dispose: (_, AnimeService service) => service.client.dispose(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tako Anime Tracker',
          theme: TakoTheme.dark(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
