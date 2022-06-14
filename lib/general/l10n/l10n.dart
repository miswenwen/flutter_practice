import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Locale myLocale = Localizations.localeOf(context);
    //print(myLocale);
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: LocalizationsRoute(),
    );
  }
}

class LocalizationsRoute extends StatefulWidget {
  const LocalizationsRoute({Key? key}) : super(key: key);

  @override
  State<LocalizationsRoute> createState() => _LocalizationsRouteState();
}

class _LocalizationsRouteState extends State<LocalizationsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}
