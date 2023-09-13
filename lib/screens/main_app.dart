import "package:flutter/material.dart";
import "package:flutter_application_1/widgets/App/home.dart";
import "package:flutter_application_1/widgets/App/settings.dart";
import "package:flutter_application_1/widgets/App/transaction_list.dart";
import "package:flutter_application_1/widgets/Drawer/drawer_column.dart";
import "package:go_router/go_router.dart";

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      drawer: const Drawer(
        child: DrawerColumn(),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: [
          const HomeScreen(),
          const TransactionListScreen(),
          const SettingsScreen(),
        ][currentPageIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/transaction");
        },
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int selected) {
          setState(() {
            currentPageIndex = selected;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.monetization_on_outlined),
            selectedIcon: Icon(Icons.monetization_on_rounded),
            label: "Transactions",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
