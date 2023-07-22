import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:q_r_code_scanner/pages/Qrcode_overlay.dart';
import 'package:q_r_code_scanner/pages/result_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

const bgcolor = Colors.grey;

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScannCompleted = false;
  void closedScreen() {
    isScannCompleted = false;
  }

  bool isFlash = false;
  bool isFrontCamera = false;
  MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFlash = !isFlash;
                });
                controller.toggleTorch();
              },
              icon: Icon(
                isFlash
                    ? Icons.flashlight_off_outlined
                    : Icons.flashlight_on_outlined,
                color: isFlash ? Colors.white : Color(0xff98fb98),
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  isFrontCamera = !isFrontCamera;
                });
                controller.switchCamera();
              },
              icon: Icon(
                isFrontCamera
                    ? Icons.cameraswitch_rounded
                    : Icons.camera_alt_outlined,
                color: isFrontCamera ? Colors.white : Color(0xff98fb98),
              ))
        ],
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text(
          'QR Code\'s Scanner',
          style: TextStyle(
              color: Color(0xff98fb98),
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Place the QR Code in the Area',
                    style: TextStyle(
                        color: Color(0xff98fb98),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  Text(
                    'Scanning will started automatically ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    MobileScanner(
                        controller: controller,
                        allowDuplicates: true,
                        onDetect: ((barcode, args) {
                          if (!isScannCompleted) {
                            String code = barcode.rawValue ?? '-----';
                            isScannCompleted = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ResultScreen(
                                          closedScreen: closedScreen,
                                          code: code,
                                        ))));
                          }
                        })),
                    QRScannerOverlay(
                      overlayColour: Colors.grey,
                    )
                  ],
                )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                'Develop by EZIO Studio',
                style: TextStyle(
                    color: Color(0xff98fb98), fontSize: 14, letterSpacing: 1),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
