import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quiver/testing/async.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

void main() {
  group('Searching test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Search gives the proper result(no of animals)',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      fAsync.run((_) async {
        dynamic toFetch =
            await OnlineRepository.fetchSearchedAnimalNames('lion');
        List<String> animalsToFetch = toFetch;

        expect(animalsToFetch.length, 5);
      });
    });
    testWidgets('Search gives no result for invalid searchKey',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      fAsync.run((_) async {
        dynamic toFetch =
            await OnlineRepository.fetchSearchedAnimalNames('123');
        List<String> animalsToFetch = toFetch;

        expect(animalsToFetch.length, 0);
      });
    });
    testWidgets('Search gives no result for empty string',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      fAsync.run((_) async {
        dynamic toFetch =
          await OnlineRepository.fetchSearchedAnimalNames('');
        List<String> animalsToFetch = toFetch;

        expect(animalsToFetch.length, 0);
      });
    });
  });
}
