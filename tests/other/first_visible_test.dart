import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_x_app/main.dart';

import '../mock.dart';

void main() {
  //firebase initialization mock
  setupFirebaseAuthMocks();
  // load app requirements like injectors, firebase sdk, sentry, storages...
  setupAllMocks();
  //start test
  testWidget();
}

void testWidget() {
  testWidgets("Flutter Launch screen Test", (WidgetTester tester) async {
    //build app and trigger a new frame
    await tester.pumpWidget(const Base());
    //looking for fake elements on rendered splash screen
    expect(find.byType(TextField), findsNothing);
    expect(find.byType(Text), findsNothing);
    expect(find.byType(Icon), findsNothing);
    expect(find.byType(Dialog), findsNothing);
    expect(find.byType(Image), findsNothing);
    //TODO thoughts about refactor at least to findsOneWidget instead od findsNothing
  });
}
