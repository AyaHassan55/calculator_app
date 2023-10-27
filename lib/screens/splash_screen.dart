import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'calc_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d2630),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
            Center(child: Text('Calculator App', style: GoogleFonts.adamina(color: Color(0xffF28F8F), fontSize: 30, fontWeight: FontWeight.bold),)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58.0),

            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
            Image(image: AssetImage(
              "assets/Calculator2.png",
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58.0),

            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    Color(0xffF28F8F),
                    // Color(0xff05152d)
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: (){
                    Navigator.push(context, PageTransition(child:  Calculator(), type: PageTransitionType.rightToLeft));
                  },
                  child: const Text("Let's start!")
              ),
            ),
          ],

        ),
      ),
    );
  }
}
