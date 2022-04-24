import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key? key,
    required GlobalKey<AnimatedCircularChartState> chartKey,
  })  : _chartKey = chartKey,
        super(key: key);

  final GlobalKey<AnimatedCircularChartState> _chartKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: Colors.black.withOpacity(.1),
          ),
        ],
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Orders Completed',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          OrdersCompletedChart(chartKey: _chartKey),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Text(
                      'Completed Today',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '4',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: const [
                    Text(
                      'Average per day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '5',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OrdersCompletedChart extends StatefulWidget {
  const OrdersCompletedChart({
    Key? key,
    required GlobalKey<AnimatedCircularChartState> chartKey,
  })  : _chartKey = chartKey,
        super(key: key);

  final GlobalKey<AnimatedCircularChartState> _chartKey;

  @override
  State<OrdersCompletedChart> createState() => _OrdersCompletedChartState();
}

class _OrdersCompletedChartState extends State<OrdersCompletedChart> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      key: widget._chartKey,
      size: const Size(160, 160),
      initialChartData: const <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            CircularSegmentEntry(
              80,
              Colors.blue,
              rankKey: 'completed',
            ),
            CircularSegmentEntry(
              20,
              Colors.grey,
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '80%',
      labelStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}
