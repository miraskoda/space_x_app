import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/firebase.dart';
import 'package:space_x_app/config/services/phrase.dart';

class InitApp extends StatefulWidget {
  final Widget child;

  const InitApp({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> with WidgetsBindingObserver {
  Future<bool>? _setupFuture;

  Future<bool> _initializeApp() async {
    try {
      await initializeFirebase(inject(), inject(), inject());
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      setupPhrase(inject());
      return true;
    } catch (e) {
      bool hasConnection;
      try {
        final List<InternetAddress> result =
            await InternetAddress.lookup('https://www.google.com');
        if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
          hasConnection = true;
        } else {
          hasConnection = false;
        }
      } on SocketException catch (_) {
        hasConnection = false;
      }

      if (!hasConnection) {
        _reportNoConnectionError();
      }

      return false;
    }
  }

  @override
  void initState() {
    _setupFuture = _initializeApp();
    super.initState();
  }

  void _reportNoConnectionError() {}

  @override
  Widget build(BuildContext context) {
    const Widget loader = SizedBox.shrink();
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _setupFuture,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return widget.child;
          }
          return loader;
        },
      ),
    );
  }
}
