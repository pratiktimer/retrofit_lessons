import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/photos/photo_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ScaffoldWithNavigationBar(
          body: PhotoListScreen(),
          selectedIndex: index,
          onDestinationSelected: (value) => UpdatePage(value),
        ),
      ),
    );
  }

  UpdatePage(int value) {
    setState(() {
      index = value;
    });
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Users', icon: Icon(Icons.person)),
          NavigationDestination(label: 'Albums', icon: Icon(Icons.photo_album)),
          NavigationDestination(label: 'Photos', icon: Icon(Icons.photo)),
          NavigationDestination(label: 'Posts', icon: Icon(Icons.podcasts)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
