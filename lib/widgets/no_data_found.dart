import 'package:flutter/material.dart';
import 'package:infinity_hr/utils/common_utils.dart';

import '../utils/custom_colors.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
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
