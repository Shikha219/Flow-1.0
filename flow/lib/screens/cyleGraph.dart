// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CycleGraph extends StatefulWidget {
//   const CycleGraph({Key? key}) : super(key: key);

//   @override
//   _CycleGraphState createState() => _CycleGraphState();
// }

// class _CycleGraphState extends State<CycleGraph> {
//   List<Color> gradientColors = [
//    const Color(0xff23b6e6),
//    const Color(0xff02d39a),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       body: Padding(
//         padding: const EdgeInsets.only(right: 22.0),
//         child: Center(
//           child: SizedBox(
//             width: 400,
//             height: 400,
//             child: LineChart(
//               LineChartData(
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(color: Colors.white , width: 2)
//                 ),
//                 gridData: FlGridData(
//                   show: true,
//                   getDrawingHorizontalLine: (value) {
//                     return FlLine(
//                       color: Colors.white,
//                       strokeWidth: 1
//                     );
//                   },
//                   drawVerticalLine: true,
//                   getDrawingVerticalLine: (value) {
//                     return FlLine(
//                       color: Colors.white,
//                       strokeWidth: 1
//                     );
//                   },
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: AxisTitles(sideTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 35,
//                     getTextStyles: (context, value) {
//                       return const TextStyle(
//                         color: Color(0xff68737d),
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold
//                       );
//                     },
//                     getTitles: (value) {
//                       switch(value.toInt()){
//                         case 0 :
//                           return 'Sep 19';
//                         case 4 :
//                           return 'Oct 10';
//                         case 8 :
//                           return 'Nov 16';
//                       }
//                       return '';
//                     },
//                     margin: 8
//                   )),
//                   rightTitles: SideTitles(),
//                   topTitles: SideTitles(),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 35,
//                     getTextStyles: (context, value) {
//                       return const TextStyle(
//                         color: Color(0xff68737d),
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold
//                       );
//                     },
//                     getTitles: (value) {
//                       switch(value.toInt()){
//                         case 0 :
//                           return '0';
//                         case 2 :
//                           return '50';
//                         case 4 :
//                           return '100';
//                         case 6 :
//                           return '150';
//                       }
//                       return '';
//                     },
//                     margin: 12,
//                   ),
//                 ),
//                 maxX: 8,
//                 maxY: 8,
//                 minY: 0,
//                 minX: 0,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: [
//                      const FlSpot(0, 0),
//                      const FlSpot(5, 5),
//                      const FlSpot(7, 6),
//                      const FlSpot(8, 4),
//                     ],
//                     isCurved: true,
//                     colors: [Colors.black12 , Colors.white70 , Colors.white],
//                     barWidth: 5,
//                     belowBarData: BarAreaData(
//                       show: true,
//                       colors: gradientColors.map((e) => e.withOpacity(0.3)).toList()
//                     )
//                   )
//                 ]
//               )
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CycleGraph extends StatefulWidget {
  const CycleGraph({super.key});

  @override
  State<CycleGraph> createState() => _CycleGraphState();
}

class _CycleGraphState extends State<CycleGraph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          color: const Color.fromARGB(255, 6, 11, 21),
          child: Column(children: [
            const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text(
                      "Cycles Report",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      ),
                    ))),
            Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.20,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      left: 12,
                      top: 44,
                      bottom: 12,
                    ),
                    child: LineChart(
                      showAvg ? avgData() : mainData(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 60,
                    height: 34,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showAvg = !showAvg;
                        });
                      },
                      child: Text(
                        'days',
                        style: TextStyle(
                          fontSize: 12,
                          color: showAvg
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('JAN', style: style);
        break;
      case 5:
        text = const Text('FEB', style: style);
        break;
      case 8:
        text = const Text('MAR', style: style);
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    const style = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    switch (value.toInt()) {
      case 1:
        text = '15';
        break;
      case 3:
        text = '22';
        break;
      case 5:
        text = '26';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff23b6e6),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff02d39a),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
