import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tako/provider/connectivitymanager.dart';
import 'package:tako/provider/tabmanager.dart';
import 'package:tako/screens/genre_categories_screen.dart';
import 'package:tako/screens/no_internet_screen.dart';
import 'package:tako/screens/searched_result_screen.dart';
import 'package:tako/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const GenreCategoriesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityManager>(context, listen: false).startMornitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
        builder: (context, tabManager, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const SearchResultScreen()));
                      },
                      icon: const Icon(Icons.search)),
                ],
                centerTitle: true,
                title: const Text(
                  'Tako Anime Tracker',
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: tabManager.goToTab,
                currentIndex: tabManager.selectedIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                    ),
                    label: 'Genres',
                  ),
                ],
              ),
              body: Consumer<ConnectivityManager>(
                  builder: (context, connectivityManager, child) {
                return connectivityManager.isOnline == true
                    ? IndexedStack(
                        children: _pages,
                        index: tabManager.selectedIndex,
                      )
                    : const NoInternetScreen();
              }),
            ));
  }
}
