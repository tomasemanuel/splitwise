import 'package:flutter/material.dart';

class BottomNavigationItems extends StatefulWidget {
  final Function currentIndex;
  const BottomNavigationItems({
    super.key,
    required this.currentIndex,
  });

  @override
  State<BottomNavigationItems> createState() => _BottomNavigationItemsState();
}

class _BottomNavigationItemsState extends State<BottomNavigationItems> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromARGB(255, 210, 130, 11),
      unselectedItemColor: Color.fromARGB(255, 137, 138, 160),
      currentIndex: index,
      elevation: 80,
      onTap: (value) => setState(() {
        widget.currentIndex(value);
        index = value;
      }),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'deudas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'notificaciones',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'perfil'),
      ],
    );
  }
}
