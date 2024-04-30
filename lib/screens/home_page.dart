import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitwise/screens/bottom_nav/bottom_navigation.dart';

import '../providers/providers.dart';
import '../routes/app_routes.dart';

class HomePageNav extends StatefulWidget {
  const HomePageNav({
    super.key,
  });
  @override
  State<HomePageNav> createState() => _HomePageNavState();
}

class _HomePageNavState extends State<HomePageNav> {
  int index = 0;
  BottomNavigationItems? bottomNavigationItems;

  @override
  void initState() {
    super.initState();
    bottomNavigationItems = BottomNavigationItems(currentIndex: (i) {
      setState(() {
        final indexProvider =
            Provider.of<IndexProvider>(context, listen: false);
        indexProvider.setIndex(i);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return PopScope(
        canPop: false,
        child: Scaffold(
          bottomNavigationBar: bottomNavigationItems,
          body: BottomRoutes(index: indexProvider.index),
        ));
  }
}
