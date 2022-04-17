import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quiver/testing/async.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

void main() {
  group('Timing test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'Time taken to fetch search result of length 5 from remote database',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      List<dynamic> _searchResults = List.empty(growable: true);
      fAsync.run((_) async {
        Stopwatch stopwatch = new Stopwatch();
        stopwatch.start();
        dynamic toFetch =
            await OnlineRepository.fetchSearchedAnimalNames('lion');
        List<String> animalsToFetch = toFetch;

        for (dynamic name in animalsToFetch) {
          dynamic animal = await OnlineRepository.fetchSingleAnimal(name);
          _searchResults.add(animal);
        }
        stopwatch.stop();
        expect(_searchResults.length, 5);

        debugPrint('$stopwatch.elapsed');
      });
    });
    testWidgets('Time taken to fetch a single animal from remote database',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      fAsync.run((_) async {
        Stopwatch stopwatch = new Stopwatch();
        stopwatch.start();

        await OnlineRepository.fetchSingleAnimal('golden-lion-tamarin');

        stopwatch.stop();
        debugPrint('$stopwatch.elapsed');
      });
    });
  });
}
