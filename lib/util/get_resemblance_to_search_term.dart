extension GetResemblanceToSearchTerm on String {
  double getResemblanceToSearchTerm(String searchTerm) {
    final thisWithoutWhitespace = replaceAll(' ', '');
    final searchTermWithoutWhitespace = searchTerm.replaceAll(' ', '');

    final thisWithoutWhitespaceLowerCase = thisWithoutWhitespace.toLowerCase();
    final searchTermWithoutWhitespaceLowerCase =
        searchTermWithoutWhitespace.toLowerCase();

    if (thisWithoutWhitespace == searchTermWithoutWhitespace) {
      return 1.0;
    }

    if (thisWithoutWhitespaceLowerCase ==
        searchTermWithoutWhitespaceLowerCase) {
      return 0.9;
    }

    if (thisWithoutWhitespaceLowerCase
        .startsWith(searchTermWithoutWhitespaceLowerCase)) {
      return 0.8;
    }

    if (thisWithoutWhitespaceLowerCase
        .contains(searchTermWithoutWhitespaceLowerCase)) {
      return 0.7;
    }

    if (thisWithoutWhitespaceLowerCase.containsCharactersInOrder(
      searchTermWithoutWhitespaceLowerCase.codeUnits,
    )) {
      return 0.6;
    }

    return 0.0;
  }

  bool containsCharactersInOrder(List<int> characters) {
    if (characters.isEmpty) {
      return true;
    }

    var characterIndex = 0;

    for (final currentCharacter in codeUnits) {
      if (currentCharacter == characters[characterIndex]) {
        characterIndex += 1;
        if (characterIndex == characters.length) {
          return true;
        }
      }
    }

    return false;
  }
}
