import 'package:flutter/material.dart';

class GridViewForMissPunch extends StatefulWidget {
  const GridViewForMissPunch({Key? key}) : super(key: key);

  @override
  State<GridViewForMissPunch> createState() => _GridViewForMissPunchState();
}

class _GridViewForMissPunchState extends State<GridViewForMissPunch> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 160,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/view_miss_punch_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "View Miss Punch",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/add_miss_punch_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "Add Miss Punch",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
        Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/miss_punch_approve_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "Miss Punch Approval",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
