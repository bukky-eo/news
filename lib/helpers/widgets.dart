import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  final String containerUrl;
  final String imageUrl;
  final String section;
  final String updates;
  const Sections(
      {Key? key,
      required this.imageUrl,
      required this.containerUrl,
      required this.section,
      required this.updates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(containerUrl))),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Image.asset(
              imageUrl,
              height: 15,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            section,
            style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          Text(
            updates,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
