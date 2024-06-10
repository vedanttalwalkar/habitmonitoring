import 'package:flutter/material.dart';

SizedBox customButton(
    {required String text,
    required String imagePath,
    required size,
    required onPressed}) {
  final width = size.width;
  return SizedBox(
      width: width > 200 ? width - 90 : width - 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset(imagePath)),
                Expanded(
                    flex: 8,
                    child: Center(
                        child: Text(
                      text,
                      style: TextStyle(fontSize: width > 80 ? 16 : 14),
                    )))
              ],
            ),
          ),
        ),
      ));
}
