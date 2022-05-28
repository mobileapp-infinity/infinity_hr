
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinity_hr/utils/commona_utils.dart';
import 'package:infinity_hr/utils/icon_utils.dart';

import '../utils/custom_colors.dart';
class NoDataFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            no_data_found,
            height: 64,
            width: 64,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'No Data Found!',
            style: TextStyle(
              color: CustomColor.colorPrimary,
              fontSize: CommonUtils.FONT_SIZE_12,
            ),
          )
        ],
      ),
    );
  }
}
