class QueryConstructor {
  static List<String> categories = [];

  static String constructSearchKeyWord(String searchKey) {
    return formatSearchKey(searchKey).toLowerCase().split(" ").join('+');
  }

  static String formatSearchKey(String searchKey) {
    return searchKey.replaceAll(new RegExp(r'[^a-zA-Z\\s]+'), ' ').trim();
  }
}
