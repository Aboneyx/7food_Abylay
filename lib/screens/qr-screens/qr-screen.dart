import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:seven_food/data/services/fridge-service.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  FridgeService fridgeService = FridgeService();
  late Barcode result;
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isFlash = false;
  bool isLoading = false;
  bool scanned = false;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = 250.0;
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 5,
          right: 5,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.flip_camera_ios,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await controller.flipCamera();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isFlash ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await controller.toggleFlash();
                      setState(() {
                        isFlash = !isFlash;
                      });
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Наведите камеру на QR-код',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.help_outline, color: Colors.white),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController qrViewController) {
    setState(() {
      this.controller = qrViewController;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if (!scanned) {
        setState(() {
          scanned = true;
        });
        isLoading = true;
        if (result.code != null) {
          try {
            await fridgeService.openFridge(result.code, context);
            print(result.code);
            setState(() {
              isLoading = false;
              scanned = false;
            });
            print(result.code);
            print('scanned $scanned');
          } catch (e) {
            setState(() {
              scanned = false;
            });
            print(e);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
