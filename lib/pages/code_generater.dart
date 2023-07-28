import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qr_flutter/qr_flutter.dart';

const bgcolor = Colors.grey;

class CodeGenerate extends StatefulWidget {
  const CodeGenerate({Key? key}) : super(key: key);

  @override
  State<CodeGenerate> createState() => _CodeGenerateState();
}

class _CodeGenerateState extends State<CodeGenerate> {
// shareimage() async {
//   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   if(image == null)return;
//   Share.shareFiles([data],);
// }

  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'QR Code\'s Generator',
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImageView(
              data: data,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 300.0,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Type the Data",
                filled: true,
                // fillColor: AppStyle.textInputColor,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // _shareQRCodeImage(data);
              },
              child: Text(
                'Share',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  // void _shareQRCodeImage(String qrData) async {
  //   try {
  //     final qrImage = QrImage(data: qrData, version: QrVersions.auto,);
  //     final byteData = await qrImage.toByteData();
  //     final Uint8List pngBytes = byteData.buffer.asUint8List();
  //     await Share.file('QR Code', 'qr_code.png', pngBytes, 'image/png');
  //   } 
  //   catch (e) {
  //     print('Error sharing QR code: $e');
  //   }
  // }
