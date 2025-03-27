import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String _currentTime = "";
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateFormat('hh:mm a, d MMMM').format(DateTime.now());
      });
    });
  }

  /// **Toggle Dark/Light Mode**
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Dark Mode: ${_isDarkMode ? 'Enabled' : 'Disabled'}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // **Removes back button**
      backgroundColor: Colors.grey[300],
      title: Row(
        children: [
          /// **App Logo**
          Image.asset(
            "assets/images/ra_logo.png",
            height: 35, // Keeps logo
          ),
          SizedBox(width: 10),
          Text(
            _currentTime,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        /// **WiFi Icon (No functionality)**
        IconButton(
          icon: Icon(Icons.wifi, color: Colors.black),
          onPressed: () {}, // No functionality
        ),

        /// **Dark/Light Mode Toggle**
        IconButton(
          icon: Icon(Icons.toggle_on_outlined, color: Colors.black),
          onPressed: _toggleDarkMode,
        ),
      ],
    );
  }
}
