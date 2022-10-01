import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/helpers/constants.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  String date = DateFormat('MMMM, dd, yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackground,
        leading: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child:
              CircleAvatar(backgroundColor: Colors.grey.shade700, radius: 35.0),
        ),
        title: Text(
          date,
          style: kAppBarStyle,
          textAlign: TextAlign.left,
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // child: CountryPickerDropdown(
            //   initialValue: 'NG',
            //   onValuePicked: (Country country){
            //     print("${country.name}")
            //   },
            //   itemBuilder: ,
            child: Icon(
              Icons.language,
              size: 35,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 10),
            child: Text(
              'Breaking News',
              style: kBigText,
            ),
          ),
        ],
      ),
    );
  }
}
