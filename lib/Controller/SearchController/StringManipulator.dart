class StringManipulator {
  static String constructSearchKeyWord(String searchKey) {
    return formatSearchKey(searchKey).toLowerCase().split(" ").join('+');
  }

  static String formatSearchKey(String searchKey) {
    return searchKey.replaceAll(new RegExp(r'[^a-zA-Z\\s]+'), ' ').trim();
  }

  static hyphenToSpace(String str) {
    return str.replaceAll(new RegExp(r'[\s-]+'), ' ');
  }

  static Iterable<String> capitalizeFirstOfEachWord(List<String> words) {
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });
    return capitalizedWords;
  }

  static customizeCommonName(String? commonName) {
    if (commonName == null) return;
    return capitalizeFirstOfEachWord(hyphenToSpace(commonName).split(' '))
        .join(' ');
  }

  static stringToList(String? str) {
    if (str == null) return;
    return capitalizeFirstOfEachWord(str
        .replaceAll(new RegExp(r', and\b'), ',')
        .replaceAll(new RegExp(r'\band\b'), ',')
        .replaceAll(new RegExp(r'[\s]+'), ' ')
        .split(','));
  }
}
