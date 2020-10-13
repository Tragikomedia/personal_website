import 'package:web_test/models/language.dart';
import 'package:web_test/utilities/enums.dart';

List<Language> languages = [
  Language(
    languageCode: LanguageCode.eng,
    description: 'English',
    abbreviation: 'Eng',
  ),
  Language(
      languageCode: LanguageCode.pl,
      description: 'polski',
      abbreviation: 'Pol'),
  Language(
      languageCode: LanguageCode.zhsm, description: '简体', abbreviation: 'Zh-S'),
  Language(
      languageCode: LanguageCode.zhtr, description: '繁体', abbreviation: 'Zh-T')
];