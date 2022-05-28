import 'package:flutter/material.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Another Screen'),),
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){},
              leading: CircleAvatar(
                child: Text('$index'),
              ),
              title: Text('Index $index'),
              subtitle: Text('SubTitle'),
            );
          },),
    );
  }
}
