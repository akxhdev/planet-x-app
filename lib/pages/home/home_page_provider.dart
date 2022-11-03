import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  var _selectedTab = HomePageTabs.feed;

  HomePageTabs get selectedTab => _selectedTab;

  void changeTab(HomePageTabs tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}

enum HomePageTabs { feed, search, notifications, account }
