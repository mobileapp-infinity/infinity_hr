import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: Icon(Icons.menu),
            color: Color(0xffE21E23),
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
          ),
        ),
        title: const Text(
          "INFINITY",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              child: Image.asset(
                "assets/images/logo.png",
                scale: 2.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Leave',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('HR'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
