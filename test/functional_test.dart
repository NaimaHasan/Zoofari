import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quiver/testing/async.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/Model/Data%20Definitions/Mammal.dart';
import 'package:zoofari/Model/Retrievers/LocalDatabase.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

void main() {
  group('functional test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Testing if Animal list is found by distinct Category(Mammal)',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      List<Animal> _list = List.empty(growable: true);
      fAsync.run((_) async {
        CategoricalAnimalFetcher categoricalFetcher =
            CategoricalAnimalFetcher();
        await categoricalFetcher.getAnimals('mammals');
        _list.addAll(categoricalFetcher.categoricalAnimalList);
        for (final animal in _list) expect(animal.runtimeType, Mammal);
      });
    });
    testWidgets('Testing functionality to favorite/unfavorite',
        (WidgetTester tester) async {
      FakeAsync fAsync = new FakeAsync();
      fAsync.run((_) async {
        await LocalDatabase.initialize();
        bool isFavorite = LocalDatabase.isFavorite('rooster');
        if (!isFavorite) {
          Animal animal = await OnlineRepository.fetchSingleAnimal('rooster');
          LocalDatabase.addFavoriteAnimal(animal);
        } else {
          Animal animal = LocalDatabase.getParticularAnimal('rooster');
          LocalDatabase.removeFavoriteAnimal(animal);
        }
        bool isNowFavorite = LocalDatabase.isFavorite('rooster');
        expect(isNowFavorite, !isFavorite);
      });
    });
    testWidgets('Testing validity of the details data of the fetched animal',
        (WidgetTester tester) async {
      var jsonResponse = {
        "common_name": "slow-worm",
        "classification": {
          "Kingdom": "Animalia",
          "Phylum": "Chordata",
          "Class": "Reptilia",
          "Order": "Squamata",
          "Family": "Anguidae",
          "Genus": "Anguis",
          "Scientific Name": "Anguis fragilis"
        },
        "general_facts": {
          "Main Prey": "Insects, Slugs, Worms",
          "Fun Fact": "Found widely throughout British gardens!",
          "Distinctive Feature": "Long snake-like body and small eyes",
          "Habitat": "Grassland and woodlands",
          "Predators": "Cats, Dogs, Birds",
          "Diet": "Carnivore",
          "Lifestyle": "Solitary",
          "Favorite Food": "Insects",
          "Type": "Reptile",
          "Average Clutch Size": "8",
          "Slogan": "Found widely throughout British gardens!",
          "Color": ["Brown", "Grey", "Yellow", "Black", "Tan"],
          "Skin Type": "Scales",
          "Top Speed": "0.3 mph",
          "Lifespan": "10 - 30 years",
          "Weight": "20g - 100g (0.7oz - 3.5oz)",
          "Length": "20cm - 50cm (8in - 20in)"
        },
        "image_link": [
          "https://a-z-animals.com/media/2019/11/Slow-worm-close-up-768x401.jpg",
          "https://a-z-animals.com/media/2019/11/Slow-worm-on-moss-768x401.jpg",
          "https://a-z-animals.com/media/2019/11/Slow-worm-in-leaves-768x401.jpg",
          "https://a-z-animals.com/media/2019/11/Slow-worm-on-leaf-768x401.jpg",
          "https://a-z-animals.com/media/2019/11/Slow-worm-baby-768x401.jpg",
          "https://a-z-animals.com/media/2019/11/Slow-worm-isolated-768x401.jpg",
          "https://a-z-animals.com/media/Slow-Worm-Anguis-Fragilis-on-moss-768x512.jpg",
          "https://a-z-animals.com/media/Slow-Worm-Anguis-Fragilis-isolated-768x512.jpg",
          "https://a-z-animals.com/media/Slow-Worm-Anguis-Fragilis-face-768x545.jpg",
          "https://a-z-animals.com/media/Slow-Worm-Anguis-Fragilis-slithering-768x576.jpg",
          "https://a-z-animals.com/media/animals/images/original/slow_worm1-768x576.jpg",
          "https://a-z-animals.com/media/animals/images/original/slow_worm.jpg"
        ],
        "conservation_status": "Least Concern"
      };
      FakeAsync fAsync = new FakeAsync();
      fAsync.run((_) async {
        Animal animal = await OnlineRepository.fetchSingleAnimal('slow-worm');
        expect(animal.rawJsonString, jsonResponse);
      });
    });
  });
}
