import 'package:flutter/material.dart';
import 'package:planetx/pages/home/app_bar.dart';
import 'package:planetx/pages/home/bottom_nav_bar.dart';
import 'package:planetx/pages/home/home_page_provider.dart';
import 'package:planetx/pages/home/screens/account.dart';
import 'package:planetx/pages/home/screens/notifications.dart';
import 'package:planetx/pages/home/screens/search.dart';
import 'package:provider/provider.dart';

import 'screens/feed/feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            layoutBuilder: (currentChild, previousChildren) {
              var currentTab = provider.selectedTab;

              var screens = {
                HomePageTabs.feed: const FeedScreen(),
                HomePageTabs.search: const SearchScreen(),
                HomePageTabs.notifications: const NotificationsScreen(),
                HomePageTabs.account: const AccountScreen(),
              };

              return screens[currentTab]!;
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
