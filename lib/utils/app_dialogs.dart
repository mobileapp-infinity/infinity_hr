import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> showCustomizeProgressDialog({
    required BuildContext context,
    required String msg,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 74,
            width: 190,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).canvasColor,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 18,
            ),
            child: Row(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Material(
                  child: FittedBox(
                    child: Text(
                      msg,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
