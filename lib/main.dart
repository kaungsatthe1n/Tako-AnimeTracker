import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import './provider/connectivitymanager.dart';
import './provider/navmanager.dart';
import './provider/tabmanager.dart';
import './screens/splash_screen.dart';
import './services/anime_service.dart';
import './theme/tako_theme.dart';

void main() async {
  _setUpLogging();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
        ChangeNotifierProvider(create: (_) => ConnectivityManager()),
        Provider(
          create: (_) => AnimeService.create(),
          dispose: (_, AnimeService service) => service.client.dispose(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MaterialApp(
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!);
          },
          debugShowCheckedModeBanner: false,
          title: 'Tako Anime Tracker',
          theme: TakoTheme.dark(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
