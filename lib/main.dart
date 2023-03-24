import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/home.dart';
import 'package:moolahgo/modules/login/login.dart';

import 'config/config.dart';
import 'main.extended.dart';

void main() async {
  await setupConfiguration();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");

  runApp(MyApp(
    startScreen: token == null ? LoginScreen() : HomeScreen(),
  ));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({Key key, this.startScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData[AppTheme.primaryLight],
      home: startScreen,
    );
  }
}
