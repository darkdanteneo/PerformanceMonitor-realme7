import 'dart:async';

import 'package:flutter/material.dart';
import 'package:root/root.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:system_alert_window/system_alert_window.dart';

void main() => runApp(TopTab());

class TopTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.device_unknown)),
                Tab(icon: Icon(Icons.hd)),
                Tab(icon: Icon(Icons.memory_rounded)),
                Tab(icon: Icon(Icons.device_thermostat)),
                Tab(icon: Icon(Icons.battery_charging_full)),
              ],
            ),
            title: Text('Performance Monitor'),
          ),
          body: TabBarView(
            children: [
              CpuGraph(),
              GpuFreqGraph(),
              RamGraph(),
              BatteryGraph(),
              FloatingWindow(),
            ],
          ),
        ),
      ),
    );
  }
}

class CpuGraph extends StatefulWidget {
  CpuGraph({Key key}) : super(key: key);
  @override
  _CpuGraphState createState() => _CpuGraphState();
}

class _CpuGraphState extends State<CpuGraph> {
  _CpuGraphState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), _updateCpuFrequency);
  }
  Timer timer;
  List<_FreqData> cpu0data = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];
  List<_FreqData> cpu6data = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];

  int count = 50;
  String _cpuFreq0;
  String _cpuFreq6;
  ChartSeriesController _chartSeriesController0;
  ChartSeriesController _chartSeriesController6;

  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
            plotAreaBorderColor: Colors.blueGrey,
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: '.Little Frequency'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesController0 = controller;
                },
                dataSource: cpu0data,
                color: const Color.fromRGBO(102, 153, 255, 50),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ]),
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: '.Big Frequency'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesController6 = controller;
                },
                dataSource: cpu6data,
                color: const Color.fromRGBO(255, 51, 0, 120),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ])
      ],
    );
  }

  void _updateCpuFrequency(Timer timer) {
    setCpuFreq();
    cpu0data.add(_FreqData(count, double.parse(_cpuFreq0) / 1000000));
    if (cpu0data.length == 51) {
      cpu0data.removeAt(0);
      _chartSeriesController0.updateDataSource(
        addedDataIndexes: <int>[cpu0data.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController0.updateDataSource(
        addedDataIndexes: <int>[cpu0data.length - 1],
      );
    }
    cpu6data.add(_FreqData(count, double.parse(_cpuFreq6) / 1000000));
    if (cpu6data.length == 51) {
      cpu6data.removeAt(0);
      _chartSeriesController6.updateDataSource(
        addedDataIndexes: <int>[cpu6data.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController6.updateDataSource(
        addedDataIndexes: <int>[cpu6data.length - 1],
      );
    }
    count++;
  }

  Future<void> setCpuFreq() async {
    Root.exec(cmd: 'cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq').then((String cpu0) {
      Root.exec(cmd: 'cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_cur_freq').then((String cpu6) {
        setState(() {
          _cpuFreq0 = cpu0;
          _cpuFreq6 = cpu6;
        });
      });
    });
  }
}

class GpuFreqGraph extends StatefulWidget {
  GpuFreqGraph({Key key}) : super(key: key);
  @override
  _GpuFreqGraphState createState() => _GpuFreqGraphState();
}

class _GpuFreqGraphState extends State<GpuFreqGraph> {
  _GpuFreqGraphState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), _updateGpuFrequency);
  }

  Timer timer;
  List<_FreqData> gpufreqdata = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];
  List<_FreqData> gpuusagedata = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];

  int count = 50;
  String _gpuFreq;
  String _gpuUse;
  ChartSeriesController _chartSeriesControllerFreq;
  ChartSeriesController _chartSeriesControllerUse;
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: 'GPU Frequency'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesControllerFreq = controller;
                },
                dataSource: gpufreqdata,
                color: const Color.fromRGBO(0, 153, 30, 150),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ]),
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: 'GPU Usage'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesControllerUse = controller;
                },
                dataSource: gpuusagedata,
                color: const Color.fromRGBO(255, 0, 102, 150),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ])
      ],
    );
  }

  void _updateGpuFrequency(Timer timer) {
    setGpuFreq();
    gpufreqdata.add(_FreqData(count, double.parse(_gpuFreq) / 1000));
    if (gpufreqdata.length == 51) {
      gpufreqdata.removeAt(0);
      _chartSeriesControllerFreq.updateDataSource(
        addedDataIndexes: <int>[gpufreqdata.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesControllerFreq.updateDataSource(
        addedDataIndexes: <int>[gpufreqdata.length - 1],
      );
    }

    gpuusagedata.add(_FreqData(count, double.parse(_gpuUse)));
    if (gpuusagedata.length == 51) {
      gpuusagedata.removeAt(0);
      _chartSeriesControllerUse.updateDataSource(
        addedDataIndexes: <int>[gpuusagedata.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesControllerUse.updateDataSource(
        addedDataIndexes: <int>[gpuusagedata.length - 1],
      );
    }
    count++;
  }

  Future<void> setGpuFreq() async {
    Root.exec(cmd: 'cat /proc/gpufreq/cur_freq').then((String freq) {
      Root.exec(cmd: 'cat /proc/mali/utilization').then((String uses) {
        uses = uses.substring(uses.indexOf('=') + 1, uses.indexOf('/0/0,'));
        setState(() {
          _gpuFreq = freq;
          _gpuUse = uses;
        });
      });
    });
    //uses = uses.substring(uses.indexOf('='), uses.indexOf('/0/0,'));
    //String uses = '5';
  }
}

class RamGraph extends StatefulWidget {
  RamGraph({Key key}) : super(key: key);
  @override
  _RamGraphState createState() => _RamGraphState();
}

class _RamGraphState extends State<RamGraph> {
  _RamGraphState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), _updateInfo);
  }
  Timer timer;
  String _util;
  String _temp;
  int count = 50;
  List<_FreqData> tempData = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];
  List<_FreqData> utildata = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];
  ChartSeriesController _chartSeriesControllerutil;
  ChartSeriesController _chartSeriesControllertemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: 'CPU Utilization'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesControllerutil = controller;
                },
                dataSource: utildata,
                color: const Color.fromRGBO(0, 150, 200, 100),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ]),
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: 'CPU Temperature'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesControllertemp = controller;
                },
                dataSource: tempData,
                color: const Color.fromRGBO(200, 50, 200, 100),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ])
      ],
    );
  }

  void _updateInfo(Timer timer) {
    setInfo();
    utildata.add(_FreqData(count, double.parse(_util)));
    if (utildata.length == 51) {
      utildata.removeAt(0);
      _chartSeriesControllerutil.updateDataSource(
        addedDataIndexes: <int>[utildata.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesControllerutil.updateDataSource(
        addedDataIndexes: <int>[utildata.length - 1],
      );
    }
    tempData.add(_FreqData(count, double.parse(_temp) / 1000));
    if (tempData.length == 51) {
      tempData.removeAt(0);
      _chartSeriesControllertemp.updateDataSource(
        addedDataIndexes: <int>[tempData.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesControllertemp.updateDataSource(
        addedDataIndexes: <int>[tempData.length - 1],
      );
    }
    count++;
  }

  Future<void> setInfo() async {
    Root.exec(cmd: 'cat /proc/oppo_healthinfo/cpu_loading').then((String util) {
      Root.exec(cmd: 'cat sys/devices/virtual/thermal/thermal_zone3/temp').then((String temp) {
        util = util.substring(util.indexOf(': ') + 2, util.indexOf('cur_cpu_ctrl'));
        setState(() {
          _util = util;
          _temp = temp;
        });
      });
    });
  }
}

class BatteryGraph extends StatefulWidget {
  BatteryGraph({Key key}) : super(key: key);
  @override
  _BatteryGraphState createState() => _BatteryGraphState();
}

class _BatteryGraphState extends State<BatteryGraph> {
  _BatteryGraphState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), _updateInfo);
  }

  Timer timer;
  String _util;
  String _temp;
  int count = 50;
  List<_FreqData> tempData = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];
  List<_FreqData> utildata = [
    _FreqData(0, 0),
    _FreqData(1, 0),
    _FreqData(2, 0),
    _FreqData(3, 0),
    _FreqData(4, 0),
    _FreqData(5, 0),
    _FreqData(6, 0),
    _FreqData(7, 0),
    _FreqData(8, 0),
    _FreqData(9, 0),
    _FreqData(10, 0),
    _FreqData(11, 0),
    _FreqData(12, 0),
    _FreqData(13, 0),
    _FreqData(14, 0),
    _FreqData(15, 0),
    _FreqData(16, 0),
    _FreqData(17, 0),
    _FreqData(18, 0),
    _FreqData(19, 0),
    _FreqData(20, 0),
    _FreqData(21, 0),
    _FreqData(22, 0),
    _FreqData(23, 0),
    _FreqData(24, 0),
    _FreqData(25, 0),
    _FreqData(26, 0),
    _FreqData(27, 0),
    _FreqData(28, 0),
    _FreqData(29, 0),
    _FreqData(30, 0),
    _FreqData(31, 0),
    _FreqData(32, 0),
    _FreqData(33, 0),
    _FreqData(34, 0),
    _FreqData(35, 0),
    _FreqData(36, 0),
    _FreqData(37, 0),
    _FreqData(38, 0),
    _FreqData(39, 0),
    _FreqData(40, 0),
    _FreqData(41, 0),
    _FreqData(42, 0),
    _FreqData(43, 0),
    _FreqData(44, 0),
    _FreqData(45, 0),
    _FreqData(46, 0),
    _FreqData(47, 0),
    _FreqData(48, 0),
    _FreqData(49, 0),
  ];
  ChartSeriesController _chartSeriesControllerutil;
  ChartSeriesController _chartSeriesControllertemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: 'Battery Utilization'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesControllerutil = controller;
                },
                dataSource: utildata,
                color: const Color.fromRGBO(0, 150, 200, 100),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ]),
        SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            title: ChartTitle(text: 'Battery Temperature'),
            series: <LineSeries<_FreqData, int>>[
              LineSeries<_FreqData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesControllertemp = controller;
                },
                dataSource: tempData,
                color: const Color.fromRGBO(200, 50, 200, 100),
                xValueMapper: (_FreqData data, _) => data.time,
                yValueMapper: (_FreqData data, _) => data.freq,
                animationDuration: 0,
              )
            ])
      ],
    );
  }

  void _updateInfo(Timer timer) {
    setInfo();
    utildata.add(_FreqData(count, double.parse(_util)));
    if (utildata.length == 51) {
      utildata.removeAt(0);
      _chartSeriesControllerutil.updateDataSource(
        addedDataIndexes: <int>[utildata.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesControllerutil.updateDataSource(
        addedDataIndexes: <int>[utildata.length - 1],
      );
    }
    tempData.add(_FreqData(count, double.parse(_temp) / 1000));
    if (tempData.length == 51) {
      tempData.removeAt(0);
      _chartSeriesControllertemp.updateDataSource(
        addedDataIndexes: <int>[tempData.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesControllertemp.updateDataSource(
        addedDataIndexes: <int>[tempData.length - 1],
      );
    }
    count++;
  }

  Future<void> setInfo() async {
    Root.exec(cmd: 'cat /sys/class/power_supply/battery/current_now').then((String util) {
      Root.exec(cmd: 'cat sys/devices/virtual/thermal/thermal_zone17/temp').then((String temp) {
        setState(() {
          _util = util.substring(0, util.length - 1);
          _temp = temp;
        });
      });
    });
  }
}

class FloatingWindow extends StatefulWidget {
  FloatingWindow({Key key}) : super(key: key);
  @override
  _FloatingWindowState createState() => _FloatingWindowState();
}

class _FloatingWindowState extends State<FloatingWindow> {
  _FloatingWindowState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), _showOverlayWindow);
  }

  bool _showFloat = false;
  bool _showing = false;
  Timer timer;
  String _cpuUtil;
  String _cpuTemp;
  String _gpuFreq;
  String _gpuUsage;
  String _cpuFreq0;
  String _cpuFreq6;
  String _batUse;
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await SystemAlertWindow.requestPermissions;
  }

  Future<void> setInfo() async {
    Root.exec(cmd: 'cat /proc/oppo_healthinfo/cpu_loading').then((String cpuUtil) {
      Root.exec(cmd: 'cat sys/devices/virtual/thermal/thermal_zone3/temp').then((String cpuTemp) {
        Root.exec(cmd: 'cat /proc/gpufreq/cur_freq').then((String gpuFreq) {
          Root.exec(cmd: 'cat /proc/mali/utilization').then((String gpuUse) {
            Root.exec(cmd: 'cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq').then((String cpu0) {
              Root.exec(cmd: 'cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_cur_freq').then((String cpu6) {
                Root.exec(cmd: 'cat /sys/class/power_supply/battery/current_now').then((String bat) {
                  setState(() {
                    _cpuUtil = cpuUtil.substring(cpuUtil.indexOf(': ') + 2, cpuUtil.indexOf('cur_cpu_ctrl') - 1);
                    _gpuUsage = gpuUse.substring(gpuUse.indexOf('=') + 1, gpuUse.indexOf('/0/0,'));
                    _cpuTemp = (int.parse(cpuTemp) / 1000).toString().substring(0, 4);
                    _gpuFreq = gpuFreq.substring(0, gpuFreq.length - 4);
                    _cpuFreq0 = (int.parse(cpu0) / 1000000).toString().substring(0, cpu0.length - 3);
                    _cpuFreq6 = (int.parse(cpu6) / 1000000).toString().substring(0, cpu6.length - 3);
                    _batUse = bat.substring(0, bat.length - 1);
                  });
                });
              });
            });
          });
        });
      });
    });
  }

  void _showOverlayWindow(Timer timer) {
    if (_showFloat) {
      _showing = true;
      setInfo();
      SystemWindowHeader header = SystemWindowHeader(
        title: SystemWindowText(text: 'CPU' + ' ' + _cpuUtil + '%', fontSize: 10, textColor: Colors.black45),
        padding: SystemWindowPadding.setSymmetricPadding(3, 3),
        subTitle: SystemWindowText(text: 'GPU' + ' ' + _gpuUsage + '%', fontSize: 10, textColor: Colors.black45),
        decoration: SystemWindowDecoration(startColor: Color.fromARGB(100, 0, 0, 0)),
      );
      SystemWindowBody body = SystemWindowBody(
        rows: [
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: 'Temp    :' + ' ' + _cpuTemp + '°C', fontSize: 10, textColor: Colors.black45),
              ),
            ],
            //gravity: ContentGravity.LEFT,
          ),
          EachRow(
            columns: [
              EachColumn(
                text:
                    SystemWindowText(text: 'BatUse :' + ' ' + _batUse + 'mA', fontSize: 10, textColor: Colors.black45),
              ),
            ],
          ),
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: 'GPU Cl :' + ' ' + _gpuFreq + 'MHz', fontSize: 10, textColor: Colors.black45),
              ),
            ],
            //gravity: ContentGravity.LEFT,
          ),
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: 'CPU1Cl:' + ' ' + _cpuFreq0 + 'GHz', fontSize: 10, textColor: Colors.black45),
              ),
            ],
            //gravity: ContentGravity.LEFT,
          ),
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: 'CPU2Cl:' + ' ' + _cpuFreq6 + 'GHz', fontSize: 10, textColor: Colors.black45),
              ),
            ],
            //gravity: ContentGravity.LEFT,
          ),
        ],
        padding: SystemWindowPadding.setSymmetricPadding(0, 3),
        decoration: SystemWindowDecoration(startColor: Color.fromARGB(100, 0, 0, 0)),
      );
      SystemWindowFooter footer = SystemWindowFooter(
        buttons: [],
        decoration: SystemWindowDecoration(startColor: Color.fromARGB(100, 0, 0, 0)),
      );
      SystemAlertWindow.updateSystemWindow(
          height: 100,
          width: 100,
          header: header,
          body: body,
          footer: footer,
          margin: SystemWindowMargin(left: 0, right: -100, top: -100, bottom: 0),
          gravity: SystemWindowGravity.TOP,
          notificationTitle: "Performance Monitor",
          notificationBody: "Hlo");
    } else if ((!_showFloat) && _showing) {
      setState(() {
        _showing = false;
      });
      SystemAlertWindow.closeSystemWindow();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Show Floating Window'),
      value: _showFloat,
      onChanged: (bool value) {
        setState(() {
          _showFloat = value;
        });
      },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}

class _FreqData {
  _FreqData(this.time, this.freq);
  final int time;
  final double freq;
}
