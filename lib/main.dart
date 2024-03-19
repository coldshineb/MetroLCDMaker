import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:main/station.dart';
import 'Util.dart';

void main() {
  runApp(GennokiokuMetroLCDMaker());
}

class GennokiokuMetroLCDMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gennokioku Metro LCD Maker',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey _globalKey = GlobalKey();
  File? _imageFile;
  List<Station> stations = [];
  String jsonFileName = "";
  Color? lineColor = Colors.blue;
  Color? lineVariantColor = Colors.blue[200];

  void _importImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png'],
      dialogTitle: '选择背景图片文件',
    );
    if (result != null) {
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
    }
  }

  void _importLineJson() async {
    stations = [];
    List<dynamic> stationsFromJson = [];
    Map<String, dynamic> jsonData;

    // 选择 JSON 文件
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      dialogTitle: '选择线路 JSON 文件',
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      try {
        // 读取 JSON 文件内容
        String jsonString = await file.readAsString();
        // 解析 JSON 数据，保存到键值对中
        jsonData = json.decode(jsonString);
        // 将站点保存到集合中
        stationsFromJson = jsonData['stations'];
        // 设置线路颜色和颜色变种
        lineColor = Util.hexToColor(jsonData['lineColor']);
        lineVariantColor = Util.hexToColor(jsonData['lineVariantColor']);
        // 站点不能少于 2
        if (stationsFromJson.length >= 2) {
          // 遍历 JSON 数据，提取站点信息，保存到 stations 集合中
          for (var item in stationsFromJson) {
            Station station = Station(
              stationNameCN: item['stationNameCN'],
              stationNameEN: item['stationNameEN'],
            );
            stations.add(station);
          }
          // 刷新页面状态
          setState(() {});
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("错误",
                      style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                  content: const Text("站点数量不能小于 2",
                      style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("好",
                          style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                    )
                  ],
                );
              });
        }
      } catch (e) {
        print('读取文件失败: $e');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("错误",
                    style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                content: const Text("选择的文件格式错误，或文件内容格式未遵循规范",
                    style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("好",
                        style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                  )
                ],
              );
            });
      }
    }
  }

  Future<void> _exportImage() async {
    if (_imageFile != null) {
      try {
        RenderRepaintBoundary boundary = _globalKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 1.5);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        var saveFile = await FilePicker.platform.saveFile(
            dialogTitle: "Select saving folder",
            fileName: "运行中 + 站名.png",
            type: FileType.image,
            allowedExtensions: ["PNG"]);
        final String path = '$saveFile';
        File imgFile = File(path);
        if (path != "null") {
          await imgFile.writeAsBytes(pngBytes);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('图片已导出',
                    style: TextStyle(fontFamily: "GennokiokuLCDFont")),
                content: Text('图片已成功保存至: $path',
                    style: const TextStyle(fontFamily: "GennokiokuLCDFont")),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('好'),
                  ),
                ],
              );
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("取消导出"),
          ));
        }
      } catch (e) {
        print('导出图片失败: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('原忆轨道交通 LCD 生成器',
            style: TextStyle(fontFamily: "GennokiokuLCDFont")),
        elevation: 4,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              MenuBar(children: [
                MenuItemButton(
                  onPressed: _importImage,
                  child: const Text(
                    "导入图片",
                    style: TextStyle(
                        fontFamily: "GennokiokuLCDFont", color: Colors.black),
                  ),
                ),
                MenuItemButton(
                  onPressed: _importLineJson,
                  child: const Text(
                    "导入站名",
                    style: TextStyle(
                        fontFamily: "GennokiokuLCDFont", color: Colors.black),
                  ),
                ),
                MenuItemButton(
                  onPressed: _exportImage,
                  child: const Text(
                    "导出图片",
                    style: TextStyle(
                        fontFamily: "GennokiokuLCDFont", color: Colors.black),
                  ),
                )
              ]),
            ],
          ),
          RepaintBoundary(
              key: _globalKey,
              child: Container(
                child: Stack(
                  children: [
                    _imageFile != null
                        ? Image.file(_imageFile!, fit: BoxFit.fitWidth)
                        : const SizedBox(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(190, 165, 0, 0),
                      child: showStationName(stations),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(190, 195, 0, 0),
                      child: showRouteLine(lineColor!),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(190, 202.5, 0, 0),
                      child: showRouteIcon(stations),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Container showRouteLine(Color color) {
    return Container(
      width: 1400,
      height: 15,
      color: color,
    );
  }

  Stack showRouteIcon(List<Station> station) {
    List<Container> tempList = [];
    for (int i = 0; i < station.length; i++) {
      tempList.add(Container(
          padding: EdgeInsets.fromLTRB(
              10 + (1400 / (station.length - 1)) * i, 0, 0, 0),
          child: CustomPaint(
            painter: StationIconPainter(
                lineColor: lineColor, lineVariantColor: lineVariantColor),
          )));
    }

    return Stack(
      children: tempList,
    );
  }

  Stack showStationName(List<Station> station) {
    //TODO 文字大小随窗口改变适应
    List<Container> tempList = [];
    double count = 0;
    for (var value in station) {
      tempList.add(Container(
        padding:
            EdgeInsets.fromLTRB((1400 / (station.length - 1)) * count, 0, 0, 0),
        child: Container(
          transform: Matrix4.rotationZ(-0.75),
          child: Text(
            value.stationNameCN,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "GennokiokuLCDFont",
              color: Colors.black,
            ),
          ),
        ),
      ));
      tempList.add(Container(
        padding: EdgeInsets.fromLTRB(
            15 + (1400 / (station.length - 1)) * count, 10, 0, 0),
        child: Container(
          transform: Matrix4.rotationZ(-0.75),
          child: Text(
            value.stationNameEN,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "GennokiokuLCDFont",
              color: Colors.black,
            ),
          ),
        ),
      ));
      count++;
    }
    return Stack(
      children: tempList,
    );
  }
}

class StationIconPainter extends CustomPainter {
  final Color? lineColor; //线路主颜色
  final Color? lineVariantColor; //线路主颜色变体

  StationIconPainter({required this.lineColor, required this.lineVariantColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = lineColor!
      ..style = PaintingStyle.fill;

    final Paint lineVariantsPaint = Paint()
      ..color = lineVariantColor!
      ..style = PaintingStyle.fill;

    // 外圈圆
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 17, linePaint);

    // 中圈圆
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 12, lineVariantsPaint);

    // 内圈圆
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 8.5, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
