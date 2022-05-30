import 'package:flutter/material.dart';

class UpdateAppScreen extends StatefulWidget {
  const UpdateAppScreen({Key? key}) : super(key: key);

  @override
  State<UpdateAppScreen> createState() => _UpdateAppScreenState();
}

class _UpdateAppScreenState extends State<UpdateAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update App'),
      ),
      body: Column(
        children:[ Text('Update Available!'),Text('')],
      ),
    );
  }
}
