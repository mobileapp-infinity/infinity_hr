import 'package:flutter/material.dart';
import 'package:infinity_hr/screens/add_leave_screen.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';
import 'package:infinity_hr/screens/view_leave_page.dart';

class GridViewForLeave extends StatefulWidget {
  late DashboardMenuEnum dashboardMenuEnum;
  late Function onDashboardMenuSelected;

  GridViewForLeave({
    super.key,
    required DashboardMenuEnum dashboardMenuEnumParam,
    required Function onDashboardMenuSelected,
  }) {
    this.dashboardMenuEnum = dashboardMenuEnumParam;
    this.onDashboardMenuSelected = onDashboardMenuSelected;
  }

  @override
  State<GridViewForLeave> createState() => _GridViewForLeaveState();
}

class _GridViewForLeaveState extends State<GridViewForLeave> {
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
        GestureDetector(
          onTap: () {
            widget.onDashboardMenuSelected(DashboardMenuEnum.leaveViewLeaves);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewLeaveScreen()));

          },
          child: Card(
            elevation: 5,
            color: widget.dashboardMenuEnum == DashboardMenuEnum.leaveViewLeaves
                ? Colors.black87
                : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.leaveViewLeaves
                    ? "assets/images/view_leave_final_white.png"
                    : "assets/images/view_leave_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "View Leaves",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.leaveViewLeaves
                          ? Colors.white
                          : Colors.black),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onDashboardMenuSelected(DashboardMenuEnum.leaveAddLeaves);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddLeaveScreen(id: "",isUpdate: false,status: "",)));
          },
          child: Card(
            elevation: 5,
            color: widget.dashboardMenuEnum == DashboardMenuEnum.leaveAddLeaves
                ? Colors.black87
                : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                    widget.dashboardMenuEnum == DashboardMenuEnum.leaveAddLeaves
                        ? "assets/images/add_leave_final_white.png"
                        : "assets/images/add_leave_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "Add Leave",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.leaveAddLeaves
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onDashboardMenuSelected(DashboardMenuEnum.leaveLeaveBalance);
          },
          child: Card(
            color:
                widget.dashboardMenuEnum == DashboardMenuEnum.leaveLeaveBalance
                    ? Colors.black87
                    : Colors.white,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.leaveLeaveBalance
                    ? "assets/images/leave_balance_final_white.png"
                    : "assets/images/leave_balance_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "Leave Balance",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.leaveLeaveBalance
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onDashboardMenuSelected(
                DashboardMenuEnum.leaveViewCancelLeaves);
          },
          child: Card(
            color: widget.dashboardMenuEnum ==
                    DashboardMenuEnum.leaveViewCancelLeaves
                ? Colors.black87
                : Colors.white,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.leaveViewCancelLeaves
                    ? "assets/images/view_cancel_leave_final_white.png"
                    : "assets/images/view_cancel_leave_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "View Cancel Leaves",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.leaveViewCancelLeaves
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget
                .onDashboardMenuSelected(DashboardMenuEnum.leaveLeaveApproval);
          },
          child: Card(
            color:
                widget.dashboardMenuEnum == DashboardMenuEnum.leaveLeaveApproval
                    ? Colors.black87
                    : Colors.white,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.leaveLeaveApproval
                    ? "assets/images/leave_approval_final_white.png"
                    : "assets/images/leave_approval_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "Leave Approval",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.leaveLeaveApproval
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onDashboardMenuSelected(
                DashboardMenuEnum.leaveCancelLeaveApproval);
          },
          child: Card(
            color: widget.dashboardMenuEnum ==
                    DashboardMenuEnum.leaveCancelLeaveApproval
                ? Colors.black87
                : Colors.white,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.leaveCancelLeaveApproval
                    ? "assets/images/cancel_leave_approval_final_white.png"
                    : "assets/images/cancel_leave_approval_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "Cancel Leave Approval",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.leaveCancelLeaveApproval
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
