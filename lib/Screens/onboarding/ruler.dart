import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:fat_loss_for_women/plugins/HorizontalPicker.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:velocity_x/velocity_x.dart';

class Rulers extends StatefulWidget {
  @override
  _RulersState createState() => new _RulersState();
}

class _RulersState extends State<Rulers> {
  double newValue = 30;
  int _currentValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(newValue.toString()),
          Container(
            child: HorizontalPicker(
              header: 'Cm',
              initialPosition: 50,
              minValue: 0,
              showNumber: true,
              maxValue: 220,
              showCursor: false,
              // divisions: 220,
              backgroundColor: Colors.transparent,
              activeItemTextColor: AppColors.black,
              passiveItemsTextColor: AppColors.TextColorLight,
              onChanged: (value) {
                newValue = value;
                setState(() {});
              },
            ),
          ),
          'kg'.text.color(AppColors.primaryColor).make(),
          NumberPicker(
            selectedTextStyle: TextStyle(
                color: Colors.black, fontSize: 33, fontWeight: FontWeight.bold),
            value: _currentValue,
            minValue: 0,
            maxValue: 100,
            step: 1,
            axis: Axis.horizontal,
            onChanged: (value) => setState(() => _currentValue = value),
          ),
          Image.asset(
            'assets/icons/Polygon 2.png',
            height: 10,
          ),
          10.heightBox,
          Text('Current value: $_currentValue'),
        ],
      ),
    );
  }
}
