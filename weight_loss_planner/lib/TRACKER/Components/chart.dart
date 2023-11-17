import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_loss_planner/Reusable/app_colors.dart';
import 'package:weight_loss_planner/TRACKER/Components/date.dart';

final data = [
  FlSpot(datePoint(DateTime(2017, 3, 19)), 120),
  FlSpot(datePoint(DateTime(2017, 4, 20)), 119),
  FlSpot(datePoint(DateTime(2017, 6, 21)), 118),
  FlSpot(datePoint(DateTime(2017, 9, 22)), 117),
  FlSpot(datePoint(DateTime(2017, 11, 23)), 115),
];

class Chart extends StatelessWidget {
  Chart({super.key});

  final List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue
  ];

  /// The Line Chart widget which gathers all data together and displays the result
  LineChartData graphData() {
    return LineChartData(
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: true,
          horizontalInterval: 25,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
                color: AppColors.mainGridLineColor, strokeWidth: 1);
          },
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: AppColors.mainGridLineColor,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
            show: true,
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: 1,
                    getTitlesWidget: bottomTitleWidgets)),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    interval: 1,
                    getTitlesWidget: leftTitleWidgets))),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        minX: 1,
        maxX: 13,
        minY: 0,
        maxY: 175,
        lineBarsData: [
          LineChartBarData(
              spots: data,
              isCurved: false,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList()
                )
              )
          )
        ]);
  }

  /// The X-Axis Data and how it will be formatted
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 91, 99, 109), 
      fontWeight: FontWeight.bold, 
      fontSize: 16
    );

    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('JAN', style: style);
        break;
      case 2:
        text = const Text('FEB', style: style);
        break;
      case 3:
        text = const Text('MAR', style: style);
        break;
      case 4:
        text = const Text('APR', style: style);
        break;
      case 5:
        text = const Text('MAY', style: style);
        break;
      case 6:
        text = const Text('JUN', style: style);
        break;
      case 7:
        text = const Text('JUL', style: style);
        break;
      case 8:
        text = const Text('AUG', style: style);
        break;
      case 9:
        text = const Text('SEP', style: style);
        break;
      case 10:
        text = const Text('OCT', style: style);
        break;
      case 11:
        text = const Text('NOV', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  /// The Y-Axis Data and how it will be formatted
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 91, 99, 109), 
      fontWeight: FontWeight.bold, 
      fontSize: 15
    );

    String text;
    switch (value.toInt()) {
      case 25:
        text = '25kg';
        break;
      case 50:
        text = '50kg';
        break;
      case 75:
        text = '75kg';
        break;
      case 100:
        text = '100kg';
        break;
      case 125:
        text = '125kg';
        break;
      case 150:
        text = '150kg';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  /// The Main Chart Component
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 2,
          height: MediaQuery.of(context).size.height / 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 0),
            child: LineChart(graphData()),
          ),
        ),
      ),
    );
  }
}
