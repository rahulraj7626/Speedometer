import 'package:flutter/material.dart';
import 'package:speedodashboard/views/constants.dart';

Widget row1() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '16:42',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                  text: '  11 feb',
                  style: TextStyle(
                      fontSize: 16,
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

Widget row3() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '500.3',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                  text: '  Km left',
                  style: TextStyle(
                      fontSize: 16,
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
