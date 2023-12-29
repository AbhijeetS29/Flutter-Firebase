import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firstyy_y/IMages.dart';
import 'package:firstyy_y/SplashScreen.dart';
import 'package:firstyy_y/firebase_options.dart';
import 'package:firstyy_y/homePage.dart';
import 'package:firstyy_y/main.dart';
import 'package:firstyy_y/trying.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

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



class Listing extends StatelessWidget {

  var bottomTexts=["one by one", "all together"];

  void performAction(BuildContext context, int index) {
    // Perform different actions based on the index
    if (index == 0) {
      // Action for the first item (index 0)
      print("Clicked on 'one by one'");
      // Navigate to ImageGalleryScreen for 'one by one'
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageGalleryScreen()),
      );
    } else if (index == 1) {
      // Action for the second item (index 1)
      print("Clicked on 'all together'");
      // Navigate to ImageGalleryScreen for 'all together'
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageGallryScreen()),
      );
    }
    // Add more conditions for additional indexes if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listing"),),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: bottomTexts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                performAction(context, index); // Pass context to performAction
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black87,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        '${index + 1}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${bottomTexts[index]}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}






class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  final picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage() async {
    if (_pickedImage != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('$fileName.jpg');

      await ref.putFile(_pickedImage!);
      print('Image uploaded to Firebase Storage.');
    } else {
      print('Please select an image first.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pickedImage != null
                ? Image.file(
              _pickedImage!,
              height: 200,
            )
                : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Listing()));
              },
              child: Text('ret Image'),
            ),
          ],
        ),
      ),
    );
  }
}

// class ImageRetrieveScreen extends StatefulWidget {
//   @override
//   _ImageRetrieveScreenState createState() => _ImageRetrieveScreenState();
// }
//
// class _ImageRetrieveScreenState extends State<ImageRetrieveScreen> {
//   List<String> _imageUrls = []; // List to store image URLs
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveImageUrls();
//   }
//
//   Future<void> _retrieveImageUrls() async {
//     firebase_storage.ListResult result =
//     await firebase_storage.FirebaseStorage.instance.ref('images').listAll();
//
//     List<firebase_storage.Reference> allImages = result.items;
//
//     for (var imageRef in allImages) {
//       String downloadURL = await imageRef.getDownloadURL();
//       setState(() {
//         _imageUrls.add(downloadURL);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Retrieval'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 4.0,
//           mainAxisSpacing: 4.0,
//         ),
//         itemCount: _imageUrls.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Image.network(
//             _imageUrls[index],
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
// }
// class ImageGalleryScreen extends StatefulWidget {
//   @override
//   _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
// }
//
// class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
//   List<String> _imageUrls = []; // List to store image URLs
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveImageUrls();
//   }
//
//   Future<void> _retrieveImageUrls() async {
//     firebase_storage.ListResult result =
//     await firebase_storage.FirebaseStorage.instance.ref('images').listAll();
//
//     List<firebase_storage.Reference> allImages = result.items;
//
//     for (var imageRef in allImages) {
//       String downloadURL = await imageRef.getDownloadURL();
//       setState(() {
//         _imageUrls.add(downloadURL);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Gallery'),
//       ),
//       body: _imageUrls.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : Container(
//         child: PhotoViewGallery.builder(
//           itemCount: _imageUrls.length,
//           builder: (BuildContext context, int index) {
//             return PhotoViewGalleryPageOptions(
//               imageProvider: NetworkImage(_imageUrls[index]),
//               minScale: PhotoViewComputedScale.contained,
//               maxScale: PhotoViewComputedScale.covered * 2,
//               heroAttributes: PhotoViewHeroAttributes(tag: index),
//             );
//           },
//           onPageChanged: (int index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           pageController: PageController(initialPage: _currentIndex),
//           enableRotation: true,
//           scrollPhysics: const BouncingScrollPhysics(),
//           backgroundDecoration: BoxDecoration(color: Colors.black),
//             loadingBuilder: (context, event) {
//               double progress = 0.0;
//               if (event != null && event.expectedTotalBytes != null) {
//                 progress = event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1);
//               }
//               return Center(
//                 child: CircularProgressIndicator(value: progress),
//               );
//             },
//
//         ),
//       ),
//     );
//   }
// }
class BookFlipAnimation extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const BookFlipAnimation({Key? key, required this.images, required this.initialIndex, required int flex}) : super(key: key);

  @override
  _BookFlipAnimationState createState() => _BookFlipAnimationState();
}

class _BookFlipAnimationState extends State<BookFlipAnimation> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color to white
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.4);
              }
              // Apply scaling animation to the image
              return Transform.scale(
                scale: 1.1 - (value.abs() * 0.1), // Adjust scaling factor as needed
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: child,
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Image.network(
              widget.images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fullscreen Image Gallery',
//       home: ImageGalleryScreen(),
//     );
//   }
// }

class ImageGallryScreen extends StatefulWidget {
  @override
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}
class _ImageGalleryScreenState extends State<ImageGallryScreen> {
  List<String> _imageUrls = []; // List to store image URLs

  @override
  void initState() {
    super.initState();
    _retrieveImageUrls();
  }

  Future<void> _retrieveImageUrls() async {
    firebase_storage.ListResult result =
    await firebase_storage.FirebaseStorage.instance.ref('images').listAll();

    List<firebase_storage.Reference> allImages = result.items;

    for (var imageRef in allImages) {
      String downloadURL = await imageRef.getDownloadURL();
      setState(() {
        _imageUrls.add(downloadURL);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body:
    _imageUrls.isEmpty
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder(

        future: _loadImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading images'));
          } else {
            return BookFlipAnimation(
              images: _imageUrls,
              initialIndex: 0,
                flex: 3// Set initial index here
            );
          }
        },
      ),
    );
  }

  Future<void> _loadImages() async {
    // Simulate loading delay (you can remove this in your actual implementation)
    await Future.delayed(Duration(seconds: 1));
  }
}

