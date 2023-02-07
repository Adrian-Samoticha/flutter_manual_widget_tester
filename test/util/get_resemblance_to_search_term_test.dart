import 'package:flutter_manual_widget_tester/util/get_resemblance_to_search_term.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'get resemblance to search term containsCharactersInOrder',
    (tester) async {
      expect('foobar'.containsCharactersInOrder('foobar'.codeUnits), true);
      expect('foobar'.containsCharactersInOrder('foo'.codeUnits), true);
      expect('foobar'.containsCharactersInOrder('fbr'.codeUnits), true);
      expect('foobar'.containsCharactersInOrder('raboof'.codeUnits), false);
      expect('foobar'.containsCharactersInOrder('fr'.codeUnits), true);

      expect(
        'FZMBGLEWXOVQRHWI'.containsCharactersInOrder('FZBLOHI'.codeUnits),
        true,
      );
      expect(
        'JAVHNXEDBMEVXXZA'.containsCharactersInOrder('JAHDVXZ'.codeUnits),
        true,
      );
      expect(
        'MDFMASXDNFKRZDWZ'.containsCharactersInOrder('FMSDFRD'.codeUnits),
        true,
      );

      expect(
        'TDTQZPEIBIBODEQU'.containsCharactersInOrder('sadjflkdasjf'.codeUnits),
        false,
      );
      expect(
        'UWVYICMDSMMNFQFY'.containsCharactersInOrder('ldsjalfjdals'.codeUnits),
        false,
      );

      expect('OONAVNMVOVYLWIII'.containsCharactersInOrder(''.codeUnits), true);
    },
  );

  testWidgets(
    'get resemblance to search term getResemblanceToSearchTerm',
    (tester) async {
      const epsilon = 0.0000001;

      expect(
        'resemblesSearchTerm'.getResemblanceToSearchTerm('resemblesSearchTerm'),
        closeTo(1.0, epsilon),
      );
      expect(
        'resemblesSearchTerm'.getResemblanceToSearchTerm('resemblessearchterm'),
        closeTo(0.9, epsilon),
      );
      expect(
        'resemblesSearchTerm'.getResemblanceToSearchTerm('resembles'),
        closeTo(0.8, epsilon),
      );
      expect(
        'resemblesSearchTerm'.getResemblanceToSearchTerm('searchterm'),
        closeTo(0.7, epsilon),
      );
      expect(
        'resemblesSearchTerm'.getResemblanceToSearchTerm('rst'),
        closeTo(0.6, epsilon),
      );
      expect(
        'resemblesSearchTerm'.getResemblanceToSearchTerm('asdf'),
        closeTo(0.0, epsilon),
      );
    },
  );
}
