import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_r_code_scanner/pages/QR_scanner.dart';
import 'package:q_r_code_scanner/pages/code_generater.dart';

const bgcolor = Colors.grey;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text(
          'QR Code\'s Scanner',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                child: Text(
                  'QR Code\'s Scanner',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 1),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_sharp,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text('Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {},
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:16.0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text('Rate us',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {},
            ),  Padding(
              padding:  EdgeInsets.symmetric(horizontal:16.0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text('Privacy & Terms',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {},
            ),  Padding(
              padding:  EdgeInsets.symmetric(horizontal:16.0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text('About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {},
            ),  Padding(
              padding:  EdgeInsets.symmetric(horizontal:16.0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ],
          
        ),
        backgroundColor: Colors.grey[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              'Welcome to Codes Scanner & Generator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1),
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'Scan A Code',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.teal,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () {
                  Get.to(QRScanner());
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'Generate A Code',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.teal,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () {
                  Get.to(CodeGenerate());
                },
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
