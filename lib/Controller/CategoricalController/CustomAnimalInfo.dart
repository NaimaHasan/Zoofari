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
        otherFeaturesMap['Diet'] = animal.diet;
        otherFeaturesMap['LifeStyle'] = animal.lifestyle;
      }
      if (animal is Amphibian) {
        otherFeaturesMap['Average Spawn Size'] = animal.avgSpawnSz;
        otherFeaturesMap['Incubation Period'] = animal.incubationPeriod;
        otherFeaturesMap['Water Type'] = animal.waterType;
      }
      if (animal is Mammal) {
        otherFeaturesMap['Age of Weaning'] = animal.ageOfWeaning;
        otherFeaturesMap['Age of Sexual Maturity'] = animal.ageOfSexualMaturity;
        otherFeaturesMap['Average Litter Size'] = animal.avgLitterSz;
      }
      if (animal is Bird) {
        otherFeaturesMap['Wingspan'] = animal.wingspan;
        otherFeaturesMap['Nesting Location'] = animal.nestingLocation;
      }
      if (animal is Fish) {
        otherFeaturesMap['Group Behavior'] = animal.groupBehavior;
        otherFeaturesMap['Estimated Population Size'] =
            animal.estimatedPopulationSz;
      }
      if (animal is Reptile) {
        otherFeaturesMap['Gestation Period'] = animal.gestationPeriod;
      }
    }
    return otherFeaturesMap;
  }

  static Map<String, String> getMiscellaneousMap(animal) {
    Map<String, String> miscellaneousMap = {};
    if (animal != null && animal is Animal) {
      var jsonString = animal.rawJsonString;
      if (animal.runtimeType != Amphibian)
        getAmphibianMiscellaneousMap(jsonString);
      if (animal.runtimeType != Mammal) getMammalMiscellaneousMap(jsonString);
      if (animal.runtimeType != Reptile) getReptileMiscellaneousMap(jsonString);
      if (animal.runtimeType != Bird) getBirdMiscellaneousMap(jsonString);
      if (animal.runtimeType != Fish) getFishMiscellaneousMap(jsonString);
    }
    return miscellaneousMap;
  }

  static Map<String, String> getAmphibianMiscellaneousMap(jsonParam) {
    Map<String, String> amphibianMiscellaneousMap = {};

    if (jsonParam["general_facts"]["Average Spawn Size"] != null) {
      amphibianMiscellaneousMap['Average Spawn Size'] =
          jsonParam["general_facts"]["Average Spawn Size"].toString();
    }
    if (jsonParam["general_facts"]["Incubation Period"] != null) {
      amphibianMiscellaneousMap['Incubation Period'] =
          jsonParam["general_facts"]["Incubation Period"].toString();
    }
    if (jsonParam["general_facts"]["Water Type"] != null) {
      amphibianMiscellaneousMap['Water Type'] =
          jsonParam["general_facts"]["Water Type"].toString();
    }
    return amphibianMiscellaneousMap;
  }

  static Map<String, String> getReptileMiscellaneousMap(jsonParam) {
    Map<String, String> reptileMiscellaneousMap = {};

    if (jsonParam["general_facts"]["Gestation Period"] != null) {
      reptileMiscellaneousMap['Gestation Period'] =
          jsonParam["general_facts"]["Gestation Period"].toString();
    }
    return reptileMiscellaneousMap;
  }

  static Map<String, String> getMammalMiscellaneousMap(jsonParam) {
    Map<String, String> mammalMiscellaneousMap = {};

    if (jsonParam["general_facts"]["Age Of Weaning"] != null) {
      mammalMiscellaneousMap['Age Of Weaning'] =
          jsonParam["general_facts"]["Age Of Weaning"].toString();
    }
    if (jsonParam["general_facts"]["Age Of Sexual Maturity"] != null) {
      mammalMiscellaneousMap['Age Of Sexual Maturity'] =
          jsonParam["general_facts"]["Age Of Sexual Maturity"].toString();
    }
    if (jsonParam["general_facts"]["Average Litter Size"] != null) {
      mammalMiscellaneousMap['Average Litter Size'] =
          jsonParam["general_facts"]["Average Litter Size"].toString();
    }
    return mammalMiscellaneousMap;
  }

  static Map<String, String> getBirdMiscellaneousMap(jsonParam) {
    Map<String, String> birdMiscellaneousMap = {};

    if (jsonParam["general_facts"]["Wingspan"] != null) {
      birdMiscellaneousMap['Wingspan'] =
          jsonParam["general_facts"]["Wingspan"].toString();
    }
    if (jsonParam["general_facts"]["Nesting Location"] != null) {
      birdMiscellaneousMap['Nesting Location'] =
          jsonParam["general_facts"]["Nesting Location"].toString();
    }
    return birdMiscellaneousMap;
  }

  static Map<String, String> getFishMiscellaneousMap(jsonParam) {
    Map<String, String> fishMiscellaneousMap = {};

    if (jsonParam["general_facts"]["Group Behavior"] != null) {
      fishMiscellaneousMap['Group Behavior'] =
          jsonParam["general_facts"]["Group Behavior"].toString();
    }
    if (jsonParam["general_facts"]["Estimated Population Size"] != null) {
      fishMiscellaneousMap['Estimated Population Size'] =
          jsonParam["general_facts"]["Estimated Population Size"].toString();
    }
    return fishMiscellaneousMap;
  }

  static String getEndangeredStatus(animal) {
    String endangeredStatus = '';
    if (animal != null && animal is Animal) {
      var jsonParam = animal.rawJsonString;
      if (jsonParam["conservation_status"] != null) {
        endangeredStatus = jsonParam["conservation_status"].toString();
      }
    }
    return endangeredStatus;
  }
}
