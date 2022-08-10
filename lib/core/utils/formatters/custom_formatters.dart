import 'package:flutter/services.dart';

FilteringTextInputFormatter englishNameFormatter() =>
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'));

FilteringTextInputFormatter fullEnglishNameFormatter() =>
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'));

FilteringTextInputFormatter chineseNameFormatter() =>
    FilteringTextInputFormatter.allow(RegExp('[\u4e00-\u9fa5]'));

FilteringTextInputFormatter lettersAndNumberFormatter() =>
    FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]'));
