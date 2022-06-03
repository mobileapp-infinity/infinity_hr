import 'package:flutter/material.dart';

class GridViewForLeave extends StatefulWidget {
  const GridViewForLeave({Key? key}) : super(key: key);

  @override
  State<GridViewForLeave> createState() => _GridViewForLeaveState();
}

class _GridViewForLeaveState extends State<GridViewForLeave> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
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
              Image.asset("assets/images/view_leave_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "View Leaves",
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
              Image.asset("assets/images/add_leave_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "Add Leave",
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
              Image.asset("assets/images/leave_balance_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "Leave Balance",
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
              Image.asset("assets/images/view_cancel_leave_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "View Cancel Leaves",
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
              Image.asset("assets/images/leave_approval_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "Leave Approval",
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
              Image.asset("assets/images/cancel_leave_approval_final_red.png"),
              Text(
                textAlign: TextAlign.center,
                "Cancel Leave Approval",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
