import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinity_hr/utils/custom_colors.dart';
import 'package:infinity_hr/utils/icon_utils.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  late Function onRefreshPageClick;

  SomethingWentWrongWidget({required this.onRefreshPageClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            something_went_wrong_icon,
            height: 180.0,
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            'Something went wrong...',
            style: TextStyle(
              fontSize: 22.0,
              color: CustomColor.colorPrimary,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'We are working on fixing the problem.\nPlease try gain.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              fontSize: 16.0,
              color: CustomColor.colorPrimary.withOpacity(0.8),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextButton.icon(
            onPressed: () => onRefreshPageClick(),
            icon: Icon(
              Icons.refresh,
              color: CustomColor.colorPrimary,
              size: 28.0,
            ),
            label: Text(
              'Refresh Page',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: CustomColor.colorPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
