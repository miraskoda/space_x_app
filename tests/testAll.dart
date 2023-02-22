import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';
import 'other/first_visible_test.dart' as first_visible_test;

void main() {
  //firebase initialization mock
  setupFirebaseAuthMocks();
  // load app requirements like injectors, firebase sdk, sentry, storages...
  setupAllMocks();
  group('First visible test', () {
    // first splash visible test
    first_visible_test.testWidget();
  });
}
