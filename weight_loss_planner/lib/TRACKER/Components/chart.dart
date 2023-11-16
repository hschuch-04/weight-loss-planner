import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../Reusable/app_colors.dart';

/// The Chart Component which will track the users weight
class Chart extends StatelessWidget {
  final Color mainLineColor;
  final Color belowLineColor;
  final Color aboveLineColor;

  /// Sets the colors to be used on the chart
  Chart({
    super.key,
    Color? mainLineColor,
    Color? belowLineColor,
    Color? aboveLineColor,
  })  : mainLineColor =
            mainLineColor ?? AppColors.contentColorYellow.withOpacity(1),
        belowLineColor =
            belowLineColor ?? AppColors.contentColorPink.withOpacity(1),
        aboveLineColor =
            aboveLineColor ?? AppColors.contentColorPurple.withOpacity(0.7);

  /// Gives the information to be shown for dates on the X-Axis
  /// Each month will have an associated value to put the info in
  /// TODO: Remove the switch statement and add a parameter for text
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 10, color: mainLineColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// The Y-Axis widgets which will show the weight indicator
  Widget leftTitleWidget(double weight, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('${weight}kg', style: TextStyle(
        color: AppColors.mainTextColor3,
        fontSize: 12,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
