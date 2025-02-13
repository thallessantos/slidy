String widgetTestGenerator(String name, String packageName, String import,
        String module, String pathModule) => '''
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:${packageName}/${import.replaceFirst("lib/", "").replaceAll("\\", "/")}';

main() {
  testWidgets('${name}Widget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(${name}Widget()));
    final textFinder = find.text('${name}');
    expect(textFinder, findsOneWidget);
  });
}
  ''';
String widgetTestGeneratorWithoutSuffix(String name, String packageName, String import, String module , String modulePath) => '''
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:${packageName}/${import.replaceFirst("lib/", "").replaceAll("\\", "/")}';

main() {
  testWidgets('${name} has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(${name}()));
    final textFinder = find.text('${name}');
    expect(textFinder, findsOneWidget);
  });
}
  ''';
