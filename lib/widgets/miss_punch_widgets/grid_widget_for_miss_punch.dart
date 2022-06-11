import 'package:flutter/material.dart';
import 'package:infinity_hr/screens/dashboard_screen.dart';

class GridViewForMissPunch extends StatefulWidget {
  late DashboardMenuEnum dashboardMenuEnum;
  late Function onDashboardMenuSelected;

  GridViewForMissPunch({
    super.key,
    required DashboardMenuEnum dashboardMenuEnumParam,
    required Function onDashboardMenuSelected,
  }) {
    dashboardMenuEnum = dashboardMenuEnumParam;
    onDashboardMenuSelected = onDashboardMenuSelected;
  }

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
        InkWell(
          onTap: () {
            widget.onDashboardMenuSelected(
                DashboardMenuEnum.missPunchViewMissPunch);
          },
          child: Card(
            color: widget.dashboardMenuEnum ==
                    DashboardMenuEnum.missPunchViewMissPunch
                ? Colors.black87
                : Colors.white,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.missPunchViewMissPunch
                    ? "assets/images/view_miss_punch_final_white.png"
                    : "assets/images/view_miss_punch_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "View Miss Punch",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.missPunchViewMissPunch
                          ? Colors.white
                          : Colors.black),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            widget.onDashboardMenuSelected(
                DashboardMenuEnum.missPunchAddMissPunch);
          },
          child: Card(
            elevation: 5,
            color: widget.dashboardMenuEnum ==
                    DashboardMenuEnum.missPunchAddMissPunch
                ? Colors.black87
                : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.missPunchAddMissPunch
                    ? "assets/images/add_miss_punch_final_white.png"
                    : "assets/images/add_miss_punch_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "Add Miss Punch",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: widget.dashboardMenuEnum ==
                              DashboardMenuEnum.missPunchAddMissPunch
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            widget.onDashboardMenuSelected(
                DashboardMenuEnum.missPunchMissPunchApproval);
          },
          child: Card(
            elevation: 5,
            color: widget.dashboardMenuEnum ==
                    DashboardMenuEnum.missPunchMissPunchApproval
                ? Colors.black87
                : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.dashboardMenuEnum ==
                        DashboardMenuEnum.missPunchMissPunchApproval
                    ? "assets/images/miss_punch_approval_final_white.png"
                    : "assets/images/miss_punch_approve_final_red.png"),
                Text(
                  textAlign: TextAlign.center,
                  "Miss Punch Approval",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: widget.dashboardMenuEnum ==
                            DashboardMenuEnum.missPunchMissPunchApproval
                        ? Colors.white
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
