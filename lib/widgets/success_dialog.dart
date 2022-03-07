import 'package:find_a_place/commons/colors.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatefulWidget {
  Function onPressFunction;
  SuccessDialog({Key? key, required this.onPressFunction}) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black54,
      ),
      Center(
          child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/check.gif',
                scale: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'REQUEST SENT',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Owner will contact you in 24 to 48 hours',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      color: kPrimaryColor,
                      onPressed: () {
                        widget.onPressFunction();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    ]);
  }
}
