import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:turbo_taxi/src/features/signup/pages/signup_screen.dart';

import 'core/core.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTheme.fontFamily,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: SignupScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
