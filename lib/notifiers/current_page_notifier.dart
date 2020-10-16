import 'package:flutter/cupertino.dart';
import 'package:web_test/utilities/enums.dart';

class CurrentPageNotifier extends ChangeNotifier {
  CurrentPage _page = CurrentPage.about;

  CurrentPage get currentPage => _page;

  set newPage(CurrentPage newPage) {
    _page = newPage;
    notifyListeners();
  }
}