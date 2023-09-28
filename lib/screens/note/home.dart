import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/note/Home/list_note.dart';
import 'package:flutter_application_1/screens/note/Home/list_reminder.dart';
import 'package:flutter_application_1/widgets/Drawer/drawer_column.dart';
import 'package:flutter_application_1/widgets/note/custom_search_delegate.dart';
import 'package:go_router/go_router.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  int currentPageIndex = 0;
  late PageController _pageController;

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final noteId = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              if (!context.mounted) return;

              context.go('/note/edit/$noteId');
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() => currentPageIndex = value);
        },
        children: const [
          ListNote(),
          ListReminder(),
        ],
      ),
      drawer: const Drawer(child: DrawerColumn()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/note/new'),
        child: const Icon(Icons.note_add_rounded),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book_rounded),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Note',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications_rounded),
            label: 'Reminder',
          ),
        ],
      ),
    );
  }
}
