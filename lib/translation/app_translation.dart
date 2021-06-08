import 'package:get/get.dart';

import 'en_US/en_us_translation.dart';
import 'es_ES/es_es_translation.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'es_ES': esEs,
      };
}
