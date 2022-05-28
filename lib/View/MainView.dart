import 'package:agencyui/View/AgencyListView.dart';
import 'package:agencyui/View/AgentListView.dart';
import 'package:agencyui/View/PropertyListView.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  @override
  void _onItemTapped(int index) {
    super.setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    AgencyListView(),
    AgentListView(),
    PropertyListView(title: 'title')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), 
              label: 'Agencies'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Agents'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Properties'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
