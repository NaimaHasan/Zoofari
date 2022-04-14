import '../../Model/Data Definitions/Amphibian.dart';
import '../../Model/Data Definitions/Animal.dart';
import '../../Model/Data Definitions/Bird.dart';
import '../../Model/Data Definitions/EndangeredAnimal.dart';
import '../../Model/Data Definitions/Fish.dart';
import '../../Model/Data Definitions/Mammal.dart';
import '../../Model/Data Definitions/Reptile.dart';

class CustomAnimalInfo {
  static T? cast<T>(x) => x is T ? x : null;

  static getTypeCastedAnimal(animal) {
    if (animal is EndangeredAnimal) {
      EndangeredAnimal? curAnimal = cast<EndangeredAnimal>(animal);
      return curAnimal;
    } else if (animal is Fish) {
      Fish? curAnimal = cast<Fish>(animal);
      return curAnimal;
    } else if (animal is Mammal) {
      Mammal? curAnimal = cast<Mammal>(animal);
      return curAnimal;
    } else if (animal is Bird) {
      Bird? curAnimal = cast<Bird>(animal);
      return curAnimal;
    } else if (animal is Reptile) {
      Reptile? curAnimal = cast<Reptile>(animal);
      return curAnimal;
    } else if (animal is Amphibian) {
      Amphibian? curAnimal = cast<Amphibian>(animal);
      return curAnimal;
    } else if (animal is Animal) {
      Animal? curAnimal = cast<Animal>(animal);
      return curAnimal;
    }
  }

  static Map<String, String> getClassificationMap(animal) {
    Map<String, String> classificationMap = {};
    if ((animal != null) && (animal is Animal)) {
      classificationMap['Kingdom'] = animal.kingdom;
      classificationMap['Phylum'] = animal.phylum;
      classificationMap['Class'] = animal.classType;
      classificationMap['Order'] = animal.order;
      classificationMap['Family'] = animal.family;
      classificationMap['Genus'] = animal.genus;
    }
    return classificationMap;
  }

  static Map<String, String> getTopInformationMap(animal) {
    Map<String, String> topInformationMap = {};
    if ((animal != null) && (animal is Animal)) {
      topInformationMap['Lifespan'] = animal.lifespan;
      topInformationMap['Average Weight'] = animal.avgWeight;
      topInformationMap['Skin Type'] = animal.skinType;
    }
    return topInformationMap;
  }

  static Map<String, String> getOtherFeaturesMap(animal) {
    Map<String, String> otherFeaturesMap = {};
    if (animal != null) {
      if (animal is Animal) {
        otherFeaturesMap['Maximum Weight'] = animal.maxWeight;
        otherFeaturesMap['Maximum Length'] = animal.maxLength;
        otherFeaturesMap['Maximum Speed'] = animal.maxSpeed;
      }
      if (animal is Amphibian) {
        otherFeaturesMap['Average Spawn Size'] = animal.avgSpawnSz;
        otherFeaturesMap['Incubation Period'] = animal.incubationPeriod;
      }
      if (animal is Mammal) {
        otherFeaturesMap['Age of Weaning'] = animal.ageOfWeaning;
        otherFeaturesMap['Age of Sexual Maturity'] = animal.ageOfSexualMaturity;
      }
      if (animal is Bird) {
        otherFeaturesMap['Wingspan'] = animal.wingspan;
      }
      if (animal is Fish) {
        otherFeaturesMap['Group Behavior'] = animal.groupBehavior;
      }
    }
    return otherFeaturesMap;
  }

  static Map<String, String> getMiscellaneousMap(animal) {
    Map<String, String> miscellaneousMap = {};
    if (animal != null) {
      if (animal is Animal) {
        miscellaneousMap['LifeStyle'] = animal.lifestyle;
      }
      if (animal is Amphibian) {
        miscellaneousMap['Water Type'] = animal.waterType;
      }
      if (animal is Mammal) {
        miscellaneousMap['Average Litter Size'] = animal.avgLitterSz;
      }
      if (animal is Reptile) {
        miscellaneousMap['Gestation Period'] = animal.gestationPeriod;
      }
      if (animal is Bird) {
        miscellaneousMap['Nesting Location'] = animal.nestingLocation;
      }
      if (animal is Fish) {
        miscellaneousMap['Estimated Population Size'] =
            animal.estimatedPopulationSz;
      }
    }
    return miscellaneousMap;
  }
}
