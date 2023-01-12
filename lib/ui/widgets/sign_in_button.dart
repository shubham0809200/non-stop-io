import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/core/route_constants.dart';

SizedBox signInButton(BuildContext context, String title, String image,
    Color backgroundcolor, Color fontColor,  Function() function) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 75,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        image != '' ?  Container(
            height: 49,
            width: 49,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ) : const SizedBox(width: 0),
          const SizedBox(width: 20),
          // font-family: 'SF Pro Text';
          Text(title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: fontColor)),
        ],
      ),
    ),
  );
}
