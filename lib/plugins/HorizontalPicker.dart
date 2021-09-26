import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'dart:math';

class HorizontalPicker extends StatefulWidget {
  final double minValue, maxValue;
  final Function(double) onChanged;
  final int initialPosition;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final String suffix;
  final String header;
  final bool showNumber;
  HorizontalPicker({
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    this.backgroundColor = Colors.white,
    this.showCursor = true,
    this.cursorColor = Colors.red,
    this.activeItemTextColor = Colors.blue,
    this.passiveItemsTextColor = Colors.grey,
    this.suffix = "",
    required this.initialPosition,
    required this.header,
    this.showNumber = false,
  }) : assert(minValue < maxValue);

  @override
  _HorizontalPickerState createState() => _HorizontalPickerState();
}

class _HorizontalPickerState extends State<HorizontalPicker> {
  List<double> valueList = [];
  late FixedExtentScrollController _scrollController;
  late int curItem;

  int selectedFontSize = 14;
  List<Map> valueMap = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < widget.maxValue - widget.minValue; i++) {
      valueMap.add({
        "value": widget.minValue + i,
        "fontSize": 16.0,
        "color": widget.passiveItemsTextColor,
      });
    }
    setScrollController();
  }

  setScrollController() {
    _scrollController = FixedExtentScrollController(
        initialItem: widget.initialPosition - widget.minValue.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: <Widget>[
            RotatedBox(
              quarterTurns: 3,
              child: ListWheelScrollView(
                  controller: _scrollController,
                  diameterRatio: 4,
                  itemExtent: 60,
                  onSelectedItemChanged: (item) {
                    curItem = item;
                    setState(() {
                      int decimalCount = 1;
                      num fac = pow(10, decimalCount);
                      valueMap[item]["value"] =
                          (valueMap[item]["value"] * fac).round() / fac;

                      widget.onChanged(valueMap[item]["value"]);
                      for (var i = 0; i < valueMap.length; i++) {
                        if (i == item) {
                          valueMap[item]["color"] = widget.activeItemTextColor;
                          valueMap[item]["fontSize"] = 28.0;
                          valueMap[item]["hasBorders"] = true;
                          valueMap[item]["header"] = widget.header;
                        } else {
                          valueMap[i]["color"] = widget.passiveItemsTextColor;
                          valueMap[i]["fontSize"] = 16.0;
                          valueMap[i]["hasBorders"] = false;
                          valueMap[i]["header"] = '';
                        }
                      }
                    });
                    setState(() {});
                  },
                  children: valueMap.map((Map curValue) {
                    return Container(
                      child: ItemWidget(
                        curValue,
                        widget.backgroundColor,
                        widget.suffix,
                        ishowNumber: widget.showNumber,
                      ),
                    );
                  }).toList()),
            ),
            Visibility(
              visible: widget.showCursor,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: widget.cursorColor.withOpacity(0.3)),
                  width: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  final Map curItem;
  final Color backgroundColor;
  final String suffix;
  final bool ishowNumber;

  const ItemWidget(
    this.curItem,
    this.backgroundColor,
    this.suffix, {
    Key? key,
    required this.ishowNumber,
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late List<String> textParts;
  late String leftText, rightText;

  @override
  void initState() {
    super.initState();
    int decimalCount = 1;
    num fac = pow(10, decimalCount);

    var mtext = ((widget.curItem["value"] * fac).round() / fac).toString();
    textParts = mtext.split(".");
    leftText = textParts.first;
    rightText = textParts.last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        // borderRadius: BorderRadius.circular(10),
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.ishowNumber)
              Column(
                children: [
                  Text(widget.curItem["header"] ?? '')
                      .text
                      .color(AppColors.primaryColor)
                      .bold
                      .maxLines(1)
                      .sm
                      .make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        leftText,
                        style: TextStyle(
                            fontSize: widget.curItem["fontSize"],
                            color: widget.curItem["color"],
                            fontWeight: rightText == "0"
                                ? FontWeight.w800
                                : FontWeight.w400),
                      ),
                      Text(
                        rightText == "0" ? "" : ".",
                        style: TextStyle(
                          fontSize: widget.curItem["fontSize"] - 3,
                          color: widget.curItem["color"],
                        ),
                      ),
                      Text(
                        rightText == "0" ? "" : rightText,
                        style: TextStyle(
                          fontSize: widget.curItem["fontSize"] - 3,
                          color: widget.curItem["color"],
                        ),
                      ),
                      (widget.suffix.isEmpty)
                          ? const SizedBox()
                          : Text(
                              widget.suffix,
                              style: TextStyle(
                                fontSize: widget.curItem["fontSize"],
                                color: widget.curItem["color"],
                              ),
                            )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 60,
                  width: 2,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
                3.widthBox,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.greyDim,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
