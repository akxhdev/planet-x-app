import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return NavigationBar(
          onDestinationSelected: (index) {
            provider.changeTab(HomePageTabs.values[index]);
          },
          selectedIndex: provider.selectedTab.index,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home),
              tooltip: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: "Search",
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              label: "Notifications",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            ),
          ],
        );
      },
    );
  }
}
