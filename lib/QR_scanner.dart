import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:q_r_code_scanner/result_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

const bgcolor = Color(0xfffafafa);

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
      drawer: Drawer(),
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
              icon: Icon(Icons.flashlight_on_outlined, color: isFlash ? Colors.grey :  Colors.black87)),
          IconButton(onPressed: () {

            setState(() {
                  isFrontCamera =!isFrontCamera;
                });
                controller.switchCamera();
          }, icon: Icon(Icons.camera_alt_outlined,color: isFrontCamera ? Colors.grey :  Colors.black87))
        ],
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text(
          'QR Code Scanner',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Place the QR Code in the Area',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  Text(
                    'Scanning will started automatically ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
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
                        
                  ],
                )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                'Develop by EZIO Studio',
                style: TextStyle(
                    color: Colors.black87, fontSize: 14, letterSpacing: 1),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
