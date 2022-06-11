import 'package:flutter/material.dart';
import 'package:infinity_hr/models/last_in_out_model.dart';
import 'package:infinity_hr/utils/custom_colors.dart';

class LastInOutForMissPunch extends StatefulWidget {
  LastInOutForMissPunch({Key? key, this.lastinoutmodel}) : super(key: key);

  List<LastInOutModel>? lastinoutmodel;

  @override
  State<LastInOutForMissPunch> createState() => _LastInOutForMissPunchState();
}

class _LastInOutForMissPunchState extends State<LastInOutForMissPunch> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Last In:-",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Text(
                          widget.lastinoutmodel![0].lastIn!,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Last Out:-",
                          style:  TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Text(
                          widget.lastinoutmodel![0].lastOut!,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: CustomColor.colorPrimary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
