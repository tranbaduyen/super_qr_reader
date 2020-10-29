import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:super_qr_reader/src/qrcode_reader_view.dart';

class ScanView extends StatefulWidget {
  final double scanBoxRatio;
  final Color boxLineColor;
  final Widget helpWidget;

  ScanView({Key key,
    this.boxLineColor = Colors.cyanAccent,
    this.helpWidget,
    this.scanBoxRatio = 0.85,
  }) : super(key: key);

  @override
  _ScanViewState createState() => new _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: _key,
        onScan: onScan,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        scanBoxRatio: widget.scanBoxRatio,
        boxLineColor: widget.boxLineColor,
        helpWidget: widget.helpWidget,
      ),
    );
  }

  Future onScan(String data) async {
    Navigator.of(context).pop(data);
  }
}
