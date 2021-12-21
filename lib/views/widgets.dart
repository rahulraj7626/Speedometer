import 'package:flutter/material.dart';
import 'package:speedodashboard/views/constants.dart';

Widget row1(String date, String time) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: time,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                  text: '  ' + date,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white60)),
            ],
          ),
        ),
        Column(
          children: const [
            Icon(
              Icons.shortcut,
              color: color4,
              size: 35,
            ),
            Text('Turn right in 45 meters',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.white60)),
          ],
        )
      ],
    ),
  );
}

Widget row3(km) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: km.toString(),
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              const TextSpan(
                  text: '  Km left',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white60)),
            ],
          ),
        ),
        Column(
          children: const [
            Icon(
              Icons.bluetooth,
              color: color6,
              size: 35,
            ),
            Text('Smartphone Connected',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.white60)),
          ],
        ),
      ],
    ),
  );
}
