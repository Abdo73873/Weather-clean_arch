import 'package:get/get.dart';
import 'package:osama/core/language/ar.dart';
import 'package:osama/core/language/en.dart';

class Translation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en":en,
    "ar":ar,
  };
}