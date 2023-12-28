import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firstyy_y/IMages.dart';
import 'package:firstyy_y/SplashScreen.dart';
import 'package:firstyy_y/firebase_options.dart';
import 'package:firstyy_y/homePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        nextScreen: ImageUploadScreen(),
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
// }// Import the Firebase Database package

class Btry extends StatelessWidget {
  const Btry({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController(); // Controller to manage text input

    void addToFirebase(String text) {
      // Get a reference to the database
      DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

      // Push the entered text to a specific node in the database
      databaseReference.child('userInputs').push().set({
        'inputText': text,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
    }

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Enter your text',
              hintText: 'Type something here',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String enteredText = _textController.text;
              addToFirebase(enteredText);
              _textController.clear(); // Clear the text field after adding to Firebase
            },
            child: Text('Add to Firebase'),
          ),
        ],
      ),
    );
  }
}

