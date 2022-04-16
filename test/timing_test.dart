import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/testing/async.dart';

void main() {
  testWidgets('Time taken to fetch an animal from Remote database',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());
    FakeAsync fAsync = new FakeAsync();
    fAsync.run((_) async {
      print('animal');
    });
    // await tester.pump();
  });
}
