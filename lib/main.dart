import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firstyy_y/SplashScreen.dart';
import 'package:firstyy_y/homePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Icons.home,
          splashTransition: SplashTransition.slideTransition,
           pageTransitionType: PageTransitionType.bottomToTop,
        nextScreen: MyHomePage(title: 'Splash Screen',),
        backgroundColor: Colors.blue));
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Centered title in the app bar
        title: Text(
          "App Name", // Replace with your app name
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        automaticallyImplyLeading: false, // Hide back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset("assets/images/firstpic.jpg"),
            ),
            SizedBox(height: 15),
            Container(
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/firstpic.jpg",
                    width: 120,
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> First()));
                    }, child: Text("hello World"),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "G wagon",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   void _incrementCounter() {
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null,
//       // appBar: AppBar(
//       //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       //   centerTitle: true,
//       //   title: Text("First Flutter",style: TextStyle(fontWeight: FontWeight.w400,letterSpacing: 1.5,fontSize: 20),),
//       // ),
//       body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                   width: 250,
//                 height: 280,
//                 decoration: BoxDecoration(
//                 color: Colors.yellow,
//                 borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Image.asset("assets/images/firstpic.jpg"),
//               ),
//               SizedBox(height: 15,),
//               Container(
//                 width: 350,
//                 height: 90,
//                 decoration: BoxDecoration(
//                   color: Colors.cyan,
//                   borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Row(
//                   children: [
//                     Image.asset("assets/images/firstpic.jpg",width: 120,height: 50,),
//                     Center(child: Text("Hello World",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),))
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text("G wagon",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
//               ),
//
//
//
//
//
//             ],
//           ),
//
//       ),
//
//     );
//   }
// }
