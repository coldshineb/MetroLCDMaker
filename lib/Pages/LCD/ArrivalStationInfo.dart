// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main/Object/Station.dart';

import '../../Object/Line.dart';
import '../../Parent/LCD.dart';
import '../../Util.dart';
import '../../Util/CustomColors.dart';
import '../../Util/Widgets.dart';

void loadFont() async {
  var fontLoader1 = FontLoader("GennokiokuLCDFont");
  fontLoader1
      .addFont(rootBundle.load('assets/font/FZLTHProGlobal-Regular.TTF'));
  var fontLoader2 = FontLoader("STZongyi");
  fontLoader2.addFont(rootBundle.load('assets/font/STZongyi.ttf'));
  await fontLoader1.load();
  await fontLoader2.load();
}

class ArrivalStationInfoRoot extends StatelessWidget {
  const ArrivalStationInfoRoot({super.key});

  @override
  Widget build(BuildContext context) {
    loadFont();
    return MaterialApp(
      theme: ThemeData(
        tooltipTheme: const TooltipThemeData(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: ArrivalStationInfo(),
    );
  }
}

class ArrivalStationInfo extends StatefulWidget {
  @override
  ArrivalStationInfoState createState() => ArrivalStationInfoState();
}

class ArrivalStationInfoState extends State<ArrivalStationInfo> with LCD {
  //这两个值是根据整体文字大小等组件调整的，不要动，否则其他组件大小都要跟着改
  static const double imageHeight = 335;
  static const double imageWidth = 1715.2;

  //用于识别组件的 key
  final GlobalKey _mainImageKey = GlobalKey();

  //背景图片字节数据
  Uint8List? _imageBytes;

  //站名集合
  List<Station> stationList = [];

  //创建换乘线路列表的列表
  List<List<Line>> transferLineList = [];

  String lineNumber = "";
  String lineNumberEN = "";

  //线路颜色，默认透明，导入文件时赋值
  Color lineColor = Colors.transparent;
  Color carriageColor = Util.hexToColor("595757");

  int? carriages;
  int? currentCarriage;

  //站名下拉菜单默认值，设空，导入文件时赋值
  String? currentStationListValue;
  String? terminusListValue;

  //站名下拉菜单默认索引，用于找到下拉菜单选择的站名所对应的英文站名，设空，下拉选择站名时赋值
  int? currentStationListIndex;
  int? terminusListIndex;

  //运行方向，用于处理已到站与终点站为中间某一站时的线条显示，0为向左行，1为向右行
  int trainDirectionValue = 1;

  //默认导出宽度
  int exportWidthValue = 2560;

  late Map<String, dynamic> jsonData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: '返回',
        ),
        title: const Text('已到站 站点信息图'),
        elevation: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              importAndExportMenubar(),
              MenuBar(children: [
                Container(
                  padding: const EdgeInsets.only(top: 14, left: 7),
                  child: const Text(
                    "运行方向",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  height: 48,
                  child: RadioMenuButton(
                      value: 0,
                      groupValue: trainDirectionValue,
                      onChanged: (v) {
                        setState(() {
                          trainDirectionValue = v!;
                        });
                      },
                      child: const Text(
                        "向左行",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Container(
                  height: 48,
                  child: RadioMenuButton(
                      value: 1,
                      groupValue: trainDirectionValue,
                      onChanged: (v) {
                        setState(() {
                          trainDirectionValue = v!;
                        });
                      },
                      child: const Text(
                        "向右行",
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ]),
              MenuBar(children: [
                Container(
                  padding: const EdgeInsets.only(top: 14, left: 7),
                  child: const Text(
                    "当前站",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                DropdownButton(
                  disabledHint: const Text(
                    "当前站",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ), //设置空时的提示文字
                  items: showStationList(stationList),
                  onChanged: (value) {
                    try {
                      int indexWhere = stationList.indexWhere(
                          (element) => element.stationNameCN == value);
                      indexWhere;
                      if (indexWhere == 2) {
                        trainDirectionValue = 0;
                      } else if (indexWhere == stationList.length - 3) {
                        trainDirectionValue = 1;
                      }
                      currentStationListIndex =
                          indexWhere; //根据选择的站名，找到站名集合中对应的索引
                      currentStationListValue = value;
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                  value: currentStationListValue,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 14),
                  child: const Text(
                    "终点站",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                DropdownButton(
                  disabledHint: const Text(
                    "终点站",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  items: showStationList(stationList),
                  onChanged: (value) {
                    try {
                      int indexWhere = stationList.indexWhere(
                          (element) => element.stationNameCN == value);
                      indexWhere;
                      if (indexWhere == 2) {
                        trainDirectionValue = 0;
                      } else if (indexWhere == stationList.length - 3) {
                        trainDirectionValue = 1;
                      }
                      terminusListIndex = indexWhere;
                      terminusListValue = value;
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                  value: terminusListValue,
                ),
              ])
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, //设置可水平、竖直滑动
                  child: Column(
                    children: [
                      //主线路图
                      RepaintBoundary(
                        key: _mainImageKey,
                        child: Container(
                          color: Util.hexToColor(CustomColors.backgroundColorLCD),
                          child: Stack(
                            children: [
                              const SizedBox(
                                width: imageWidth,
                                height: imageHeight,
                              ),
                              _imageBytes != null
                                  ? SizedBox(
                                      height: imageHeight,
                                      child: Image.memory(
                                        _imageBytes!,
                                      ),
                                    )
                                  : const SizedBox(),
                              gennokiokuRailwayTransitLogoWidget(),
                              lineNumberIconWidget(
                                  lineColor, lineNumber, lineNumberEN),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(522.5, 8, 0, 0),
                                  child: const Text(
                                    "当前站",
                                    style: TextStyle(fontSize: 28
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      516.5, 41, 0, 0),
                                  child: const Text(
                                    "Current station",
                                    style: TextStyle(fontSize: 14
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(911.5, 8, 0, 0),
                                  child: const Text(
                                    "终点站",
                                    style: TextStyle(fontSize: 28
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      924.5, 41, 0, 0),
                                  child: const Text(
                                    "Terminus",
                                    style: TextStyle(fontSize: 14
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(619, 8, 0, 0),
                                  child: Text(
                                    currentStationListIndex == null
                                        ? ""
                                        : stationList[currentStationListIndex!]
                                            .stationNameCN,
                                    //默认时索引为空，不显示站名；不为空时根据索引对应站名显示
                                    style: const TextStyle(fontSize: 28
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      1010.5, 8, 0, 0),
                                  child: Text(
                                    terminusListIndex == null
                                        ? ""
                                        : stationList[terminusListIndex!]
                                            .stationNameCN,
                                    style: const TextStyle(fontSize: 28
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      619.5, 41, 0, 0),
                                  child: Text(
                                    currentStationListIndex == null
                                        ? ""
                                        : stationList[currentStationListIndex!]
                                            .stationNameEN,
                                    style: const TextStyle(fontSize: 14
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      1010.5, 41, 0, 0),
                                  child: Text(
                                    terminusListIndex == null
                                        ? ""
                                        : stationList[terminusListIndex!]
                                            .stationNameEN,
                                    style: const TextStyle(fontSize: 14
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  )),
                              arrivalStationInfoBody(),
                              carriage(),
                              hereMark(),
                              directionMarkLeft(),
                              directionMarkRight(),
                              transferFrame(),
                              transferIcon(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
      //重置按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //重置所有变量
          _imageBytes = null;
          stationList.clear();
          transferLineList.clear();
          lineColor = Colors.transparent;
          currentStationListIndex = null;
          terminusListIndex = null;
          currentStationListValue = null;
          terminusListValue = null;
          lineNumber = "";
          lineNumberEN = "";
          carriages = null;
          currentCarriage = null;
          setState(() {});
        },
        tooltip: '重置',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Container transferFrame() {
    Container container = Container();
    if (stationList.isNotEmpty &&
        transferLineList[currentStationListIndex!].isNotEmpty) {
      String colorStr = jsonData['lineColor'];
      colorStr = colorStr.replaceAll('#', '');
      String s =
          Util.arrivalStationInfoTransfer.replaceAll("lineColor", colorStr);
      container = Container(
        padding: const EdgeInsets.only(left: 1348, top: 80),
        child: SvgPicture.string(height: 206, width: 206, s),
      );
    }
    return container;
  }

  //显示换乘线路图标
  Container transferIcon() {
    List<Container> c = [];
    if (currentStationListIndex != null) {
      List<Line> value = transferLineList[currentStationListIndex!];
      if (value.isNotEmpty) {
        switch (value.length) {
          case 1:
            c.add(Container(
              padding: const EdgeInsets.only(top: 60),
              child: transferIconWidget(value, 0),
            ));
            break;
          case 2:
            c.add(Container(
              padding: const EdgeInsets.only(top: 30),
              child: transferIconWidget(value, 0),
            ));
            c.add(Container(
              padding: const EdgeInsets.only(top: 100),
              child: transferIconWidget(value, 1),
            ));
            break;
          case 3:
            c.add(Container(
              padding: const EdgeInsets.only(top: 0),
              child: transferIconWidget(value, 0),
            ));
            c.add(Container(
              padding: const EdgeInsets.only(top: 60),
              child: transferIconWidget(value, 1),
            ));
            c.add(Container(
              padding: const EdgeInsets.only(top: 120),
              child: transferIconWidget(value, 2),
            ));
            break;
          default:
        }
      }
    }
    return Container(
      padding: const EdgeInsets.only(left: 1535, top: 98),
      child: Stack(
        children: c,
      ),
    );
  }

  Transform transferIconWidget(List<Line> value, int index) {
    return Transform.scale(
      scale: 1.27,
      child: Widgets.lineNumberIcon(Util.hexToColor(value[index].lineColor),
          value[index].lineNumber, value[index].lineNumberEN),
    );
  }

  Container directionMarkLeft() {
    Container container = Container();
    if (stationList.isNotEmpty) {
      switch (trainDirectionValue) {
        case 0:
          container = Container(
            padding: const EdgeInsets.only(left: 380, top: 251.5),
            child: SvgPicture.asset(
                height: 22,
                width: 22,
                "assets/image/arrivalStationInfoDirectionToLeft.svg"),
          );
          break;
        case 1:
          container = Container(
            padding: const EdgeInsets.only(left: 380, top: 251.5),
            child: SvgPicture.asset(
                height: 22,
                width: 22,
                "assets/image/arrivalStationInfoDirectionToRight.svg"),
          );
          break;
        default:
      }
    }
    return container;
  }

  Container directionMarkRight() {
    Container container = Container();
    if (stationList.isNotEmpty) {
      switch (trainDirectionValue) {
        case 0:
          container = Container(
            padding: const EdgeInsets.only(left: 1186, top: 251.5),
            child: SvgPicture.asset(
                height: 22,
                width: 22,
                "assets/image/arrivalStationInfoDirectionToLeft.svg"),
          );
          break;
        case 1:
          container = Container(
            padding: const EdgeInsets.only(left: 1186, top: 251.5),
            child: SvgPicture.asset(
                height: 22,
                width: 22,
                "assets/image/arrivalStationInfoDirectionToRight.svg"),
          );
          break;

        default:
      }
    }
    return container;
  }

  Container carriage() {
    List<Container> tempList = [];
    if (carriages != null) {
      for (int i = 1; i < carriages! + 1; i++) {
        tempList.add(Container(
          alignment: Alignment.center,
          height: 61,
          width: (722 - 4 * (carriages! - 1)) / carriages!,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: carriageColor),
          child: Transform.translate(
            offset: const Offset(0, -4),
            child: Text(
              "$i",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 43,
              ),
            ),
          ),
        ));
        tempList.add(Container(
          width: 4,
        ));
      }
      tempList
          .replaceRange(2 * currentCarriage! - 2, 2 * currentCarriage! - 1, [
        Container(
          alignment: Alignment.center,
          height: 61,
          width: (722 - 4 * (carriages! - 1)) / carriages!,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: lineColor),
          child: Transform.translate(
            offset: const Offset(0, -4),
            child: Text(
              "$currentCarriage",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 43,
              ),
            ),
          ),
        )
      ]);
    }
    return Container(
        padding: const EdgeInsets.only(left: 460, top: 184),
        child: Row(children: tempList));
  }

  Container hereMark() {
    Container container = Container();
    if (carriages != null) {
      container = Container(
          padding: EdgeInsets.only(
              left: 457.5 + //初始位置
                  (726 / carriages! - 4) / 2 - //加上图标的一半宽度
                  71 / 2 + //减去当前车厢标识的一半宽度，前三步计算出首个当前车厢标识的位置
                  726 / carriages! * (currentCarriage! - 1), //加上图标的宽度
              top: 251.5),
          child: SvgPicture.asset(
            "assets/image/arrivalStationInfoHere.svg",
            height: 71,
            width: 71,
          ));
    }
    return container;
  }

  Container arrivalStationInfoBody() {
    Container container = Container();
    if (lineColor != Colors.transparent) {
      String colorStr = jsonData['lineColor'];
      colorStr = colorStr.replaceAll('#', '');
      String s = lineColor.computeLuminance() > 0.5
          ? Util.arrivalStationInfoBody.replaceAll("fontColor", "000000")
          : Util.arrivalStationInfoBody.replaceAll("fontColor", "ffffff");
      s = s.replaceAll("lineColor", colorStr);
      container = Container(
          padding: const EdgeInsets.fromLTRB(330, 66, 0, 0),
          height: 300,
          width: 1323,
          child: SvgPicture.string(s));
      return container;
    } else {
      return container;
    }
  }

  MenuBar importAndExportMenubar() {
    return MenuBar(children: [
      // Container(
      //   height: 48,
      //   child: MenuItemButton(
      //     onPressed: _importImage,
      //     child: const Text(
      //       "导入图片",
      //       style: TextStyle(color: Colors.black),
      //     ),
      //   ),
      // ),
      Container(
        height: 48,
        child: MenuItemButton(
          onPressed: importLineJson,
          child: const Text(
            "导入线路",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      const VerticalDivider(),
      const VerticalDivider(),
      Container(
        height: 48,
        child: MenuItemButton(
          onPressed: exportAllImage,
          child: const Text(
            "导出全部图",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      const VerticalDivider(),
      Container(
        height: 48,
        child: MenuItemButton(
          onPressed: exportMainImage,
          child: const Text(
            "导出主线路图",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 14),
        child: const Text(
          "导出分辨率",
          style: TextStyle(color: Colors.black),
        ),
      ),
      DropdownButton(
        items: Widgets.resolutionListLCD(),
        onChanged: (value) {
          setState(() {
            exportWidthValue = value!;
          });
        },
        value: exportWidthValue,
      ),
    ]);
  }

  //导入背景图片，图片样式复刻已完成，此功能此后只做开发用途
  void _importImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['png'],
      dialogTitle: '选择背景图片文件',
    );
    if (result != null) {
      Uint8List? bytes = result.files.single.bytes;
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  //导入线路文件
  @override
  void importLineJson() async {
    List<dynamic> stationsFromJson = [];

    // 选择 JSON 文件
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withData: true,
        allowedExtensions: ['json'],
        dialogTitle: '选择线路 JSON 文件',
        lockParentWindow: true);
    if (result != null) {
      Uint8List bytes = result.files.single.bytes!;
      //尝试读取文件
      try {
        // 读取 JSON 文件内容
        String jsonString = utf8.decode(bytes);
        // 解析 JSON 数据，保存到键值对中
        jsonData = json.decode(jsonString);
        // 将站点保存到临时集合中
        stationsFromJson = jsonData['stations'];

        int carriagesFromJson = int.parse(jsonData['carriages']);
        int currentCarriageFromJson = int.parse(jsonData['currentCarriage']);

        if (currentCarriageFromJson > carriagesFromJson ||
            currentCarriageFromJson < 1) {
          alertDialog("错误", "当前车厢不在车厢总数范围内");
        } else {
          //清空或重置可能空或导致显示异常的变量，只有文件格式验证无误后才清空
          stationList.clear();
          transferLineList.clear();
          currentStationListIndex = 0; //会导致显示的是前一个索引对应的站点
          terminusListIndex = 0;

          // 设置线路颜色和颜色变体
          lineNumber = jsonData['lineNumber'];
          lineNumberEN = jsonData['lineNumberEN'];
          lineColor = Util.hexToColor(jsonData['lineColor']);
          carriages = carriagesFromJson;
          currentCarriage = currentCarriageFromJson;

          // 遍历临时集合，获取站点信息，保存到 stations 集合中

          for (dynamic item in stationsFromJson) {
            //换乘信息和站点信息分开存，简化代码，显示换乘线路图标时直接读换乘线路列表的列表
            //创建换乘线路列表
            List<Line> transferLines = [];
            //判断是否有换乘信息
            if (item['transfer'] != null) {
              //读取换乘信息并转为换乘线路列表
              List<dynamic> transfers = item['transfer'];
              transferLines = transfers.map((transfer) {
                return Line(transfer['lineNumber'],
                    lineNumberEN: transfer['lineNumberEN'],
                    lineColor: transfer['lineColor']);
              }).toList();
            }
            //添加换乘信息列表到换乘信息列表的列表
            transferLineList.add(transferLines);

            Station station = Station(
              stationNameCN: item['stationNameCN'],
              stationNameEN: item['stationNameEN'],
            );
            stationList.add(station);
          }

          //文件成功导入后将下拉菜单默认值设为第一站
          currentStationListValue = stationList[0].stationNameCN;
          terminusListValue = stationList[0].stationNameCN;
          // 刷新页面状态
          setState(() {});
        }
      } catch (e) {
        print('读取文件失败: $e');
        alertDialog("错误", "选择的文件格式错误，或文件内容格式未遵循规范");
      }
    }
  }

  //导出全部图
  @override
  void exportAllImage() async {
    if (stationList.isNotEmpty) {
      String? path = await FilePicker.platform.getDirectoryPath();
      if (path != null) {
        if (currentStationListIndex! < terminusListIndex!) {
          for (int i = 0; i < terminusListIndex! + 1; i++) {
            currentStationListIndex = i;
            setState(() {});
            //图片导出有bug，第一轮循环的第一张图不会被刷新状态，因此复制了一遍导出来变相解决bug，实际效果不变
            //断点调试时发现setState后状态并不会立即刷新，而是在第一个exportImage执行后才刷新，因此第一张图不会被刷新状态
            //另一个发现：在断点importImage时发现，setState执行完后不会立即刷新，而是在后面的代码执行完后才刷新
            await exportImage(
                _mainImageKey,
                "$path\\已到站 站点信息图 ${currentStationListIndex! + 1} ${stationList[currentStationListIndex!].stationNameCN}, $terminusListValue方向.png",
                false);
            await exportImage(
                _mainImageKey,
                "$path\\已到站 站点信息图 ${currentStationListIndex! + 1} ${stationList[currentStationListIndex!].stationNameCN}, $terminusListValue方向.png",
                false);
          }
        } else if (currentStationListIndex! > terminusListIndex!) {
          for (int i = terminusListIndex!; i < stationList.length; i++) {
            currentStationListIndex = i;
            setState(() {});
            //图片导出有bug，第一轮循环的第一张图不会被刷新状态，因此复制了一遍导出来变相解决bug，实际效果不变
            await exportImage(
                _mainImageKey,
                "$path\\已到站 站点信息图 ${stationList.length - currentStationListIndex!} ${stationList[currentStationListIndex!].stationNameCN}, $terminusListValue方向.png",
                false);
            await exportImage(
                _mainImageKey,
                "$path\\已到站 站点信息图 ${stationList.length - currentStationListIndex!} ${stationList[currentStationListIndex!].stationNameCN}, $terminusListValue方向.png",
                false);
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("图片已成功保存至: $path"),
        ));
      }
    } else {
      noStationsSnackbar();
    }
  }

  //导出主线路图
  Future<void> exportMainImage() async {
    if (stationList.isNotEmpty) {
      await exportImage(
          _mainImageKey,
          await getExportPath(context, "保存",
              "五站图 已到站 ${currentStationListIndex! + 1} $currentStationListValue, $terminusListValue方向.png"),
          true);
    } else {
      noStationsSnackbar();
    }
  }

  //通用提示对话框方法
  void alertDialog(String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("好"),
              )
            ],
          );
        });
  }

  //无线路信息 snackbar
  void noStationsSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("无线路信息"),
    ));
  }

  //通用导出方法
  @override
  Future<void> exportImage(
      GlobalKey key, String? path, bool showSnackbar) async {
    //路径检验有效，保存
    if (path != null) {
      try {
        //获取 key 对应的 stack 用于获取宽度
        RenderBox findRenderObject =
            key.currentContext!.findRenderObject() as RenderBox;

        //获取 key 对应的 stack 用于获取图片
        RenderRepaintBoundary boundary =
            key.currentContext!.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(
            pixelRatio: exportWidthValue /
                findRenderObject
                    .size.width); //确保导出的图片宽高默认为2560*500，可通过下拉列表选择其他预设分辨率
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        File imgFile = File(path);
        await imgFile.writeAsBytes(pngBytes);
      } catch (e) {
        print('导出图片失败: $e');
      }
      if (showSnackbar) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("图片已成功保存至: $path"),
        ));
      }
    }
  }
}