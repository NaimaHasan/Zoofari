class OnlineRepository {
  // String _url;

  // OnlineRepository(this._url);

  // String get url => _url;

  // set url(String value) {
  //   _url = value;
  // }

  // String getAnimals(String category) {
  //   String jsonString = '';
  //   //do api call
  //   return jsonString;
  // }

  // String getSearchedAnimals(String query) {
  //   String jsonString = '';
  //   //concatenate query with url
  //   //do api call
  //   return jsonString;
  // }
  static const String _hostWebsite = "https://a-z-animals-api.herokuapp.com";

  static const String _allAnimalsURL = _hostWebsite + '/animals';

  static String get allAnimalsURL => _allAnimalsURL;

  static String getAnimalTypeURL(String animalType) => _allAnimalsURL + '/$animalType';
  
  static String getAnimalDetailURL(String animalName) => _allAnimalsURL + '/name=$animalName';

  static String getSearchURL(String searchText) {
    String parsedText = searchText.toLowerCase().replaceAll(' ', '+');
 
    return _hostWebsite + '/search/$parsedText';
  }
}
