import 'package:find_a_place/commons/colors.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black54,
      width: fwidth,
      height: fheight,
      child: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(
                  color: kredColor,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'LOADING..',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kdarkgreyColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
