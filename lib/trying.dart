// // import 'package:flutter/material.dart';
// // import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// // import 'package:flutter/services.dart';
// //
// // class BookFlipAnimation extends StatefulWidget {
// //   final List<String> images;
// //   final int initialIndex;
// //
// //   const BookFlipAnimation({Key? key, required this.images, required this.initialIndex}) : super(key: key);
// //
// //   @override
// //   _BookFlipAnimationState createState() => _BookFlipAnimationState();
// // }
// //
// // class _BookFlipAnimationState extends State<BookFlipAnimation> {
// //   late PageController _pageController;
// //   int _currentPage = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _currentPage = widget.initialIndex;
// //     _pageController = PageController(initialPage: _currentPage);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   void _onPageChanged(int page) {
// //     setState(() {
// //       _currentPage = page;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
// //       statusBarColor: Colors.white, // Set the status bar color to white
// //     ));
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: PageView.builder(
// //         controller: _pageController,
// //         itemCount: widget.images.length,
// //         onPageChanged: _onPageChanged,
// //         itemBuilder: (context, index) {
// //           return AnimatedBuilder(
// //             animation: _pageController,
// //             builder: (context, child) {
// //               double value = 1.0;
// //               if (_pageController.position.haveDimensions) {
// //                 value = _pageController.page! - index;
// //                 value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.4);
// //               }
// //               // Apply scaling animation to the image
// //               return Transform.scale(
// //                 scale: 1.1 - (value.abs() * 0.1), // Adjust scaling factor as needed
// //                 child: Center(
// //                   child: Padding(
// //                     padding: EdgeInsets.all(5),
// //                     child: ClipRRect(
// //                       borderRadius: BorderRadius.circular(5.0),
// //                       child: SizedBox(
// //                         width: MediaQuery.of(context).size.width,
// //                         height: MediaQuery.of(context).size.height,
// //                         child: child,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             },
// //             child: Image.network(
// //               widget.images[index],
// //               fit: BoxFit.cover,
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Fullscreen Image Gallery',
// // //       home: ImageGalleryScreen(),
// // //     );
// // //   }
// // // }
// //
// // class ImageGalleryScreen extends StatefulWidget {
// //   @override
// //   _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
// // }
// //
// // class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
// //   List<String> _imageUrls = []; // List to store image URLs
// //   int _currentIndex = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _retrieveImageUrls();
// //   }
// //
// //   Future<void> _retrieveImageUrls() async {
// //     firebase_storage.ListResult result =
// //     await firebase_storage.FirebaseStorage.instance.ref('images').listAll();
// //
// //     List<firebase_storage.Reference> allImages = result.items;
// //
// //     for (var imageRef in allImages) {
// //       String downloadURL = await imageRef.getDownloadURL();
// //       setState(() {
// //         _imageUrls.add(downloadURL);
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Image Gallery'),
// //       ),
// //       body: _imageUrls.isEmpty
// //           ? Center(child: CircularProgressIndicator())
// //           : BookFlipAnimation(images: _imageUrls, initialIndex: _currentIndex),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/services.dart';
//
// class BookFlipAnimation extends StatefulWidget {
//   final List<String> images;
//   final int initialIndex;
//
//   const BookFlipAnimation({Key? key, required this.images, required this.initialIndex}) : super(key: key);
//
//   @override
//   _BookFlipAnimationState createState() => _BookFlipAnimationState();
// }
//
// class _BookFlipAnimationState extends State<BookFlipAnimation> {
//   late PageController _pageController;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentPage = widget.initialIndex;
//     _pageController = PageController(initialPage: _currentPage);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   void _onPageChanged(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.white, // Set the status bar color to white
//     ));
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 200, // Adjust the height as needed
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: widget.images.length,
//               onPageChanged: _onPageChanged,
//               itemBuilder: (context, index) {
//                 return AnimatedBuilder(
//                   animation: _pageController,
//                   builder: (context, child) {
//                     double value = 1.0;
//                     if (_pageController.position.haveDimensions) {
//                       value = _pageController.page! - index;
//                       value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.4);
//                     }
//                     // Apply scaling animation to the image
//                     return Transform.scale(
//                       scale: 1.1 - (value.abs() * 0.1), // Adjust scaling factor as needed
//                       child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(5),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(5.0),
//                             child: SizedBox(
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.height,
//                               child: child,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Image.network(
//                     widget.images[index],
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Text(
//               'Image Names',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 8),
//           Container(
//             height: 80, // Adjust the height as needed
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.images.length,
//               itemBuilder: (context, index) {
//                 // Extract the image name from the URL (you might need to adjust this logic based on your URL structure)
//                 String imageName = widget.images[index].split('/').last;
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Chip(
//                     label: Text(imageName),
//                     backgroundColor: _currentPage == index ? Colors.blue : Colors.grey,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
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
// class ImageGalleryScreen extends StatefulWidget {
//   @override
//   _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
// }
//
// class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
//   List<String> _imageUrls = [];
//   List<String> _imageNames = [];
//   int _selectedImageIndex = -1;
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
//       String imageName = imageRef.name;
//       setState(() {
//         _imageUrls.add(downloadURL);
//         _imageNames.add(imageName);
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
//           : Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: ListView.builder(
//               itemCount: _imageNames.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_imageNames[index]),
//                   onTap: () {
//                     setState(() {
//                       _selectedImageIndex = index;
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: _selectedImageIndex == -1
//                 ? Center(child: Text('Tap an image name to view'))
//                 : InteractiveViewer(
//               panEnabled: true,
//               boundaryMargin: EdgeInsets.all(20),
//               minScale: 0.1,
//               maxScale: 4.0,
//               child: Image.network(
//                 _imageUrls[_selectedImageIndex],
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // VERTICAL IMAGE VIEWER
// // class ImageGalleryScreen extends StatefulWidget {
// //   @override
// //   _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
// // }
// //
// // class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
// //   List<String> _imageUrls = [];
// //   int _selectedImageIndex = -1;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _retrieveImageUrls();
// //   }
// //
// //   Future<void> _retrieveImageUrls() async {
// //     firebase_storage.ListResult result =
// //     await firebase_storage.FirebaseStorage.instance.ref('images').listAll();
// //
// //     List<firebase_storage.Reference> allImages = result.items;
// //
// //     for (var imageRef in allImages) {
// //       String downloadURL = await imageRef.getDownloadURL();
// //       setState(() {
// //         _imageUrls.add(downloadURL);
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Image Gallery'),
// //       ),
// //       body: _imageUrls.isEmpty
// //           ? Center(child: CircularProgressIndicator())
// //           : Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: _imageUrls.length,
// //               itemBuilder: (context, index) {
// //                 return GestureDetector(
// //                   onTap: () {
// //                     setState(() {
// //                       _selectedImageIndex = index;
// //                     });
// //                   },
// //                   child: Container(
// //                     padding: EdgeInsets.all(8),
// //                     child: Image.network(
// //                       _imageUrls[index],
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           if (_selectedImageIndex != -1)
// //             Expanded(
// //               flex: 2,
// //               child: InteractiveViewer(
// //                 panEnabled: true,
// //                 boundaryMargin: EdgeInsets.all(20),
// //                 minScale: 0.1,
// //                 maxScale: 4.0,
// //                 child: Image.network(
// //                   _imageUrls[_selectedImageIndex],
// //                   fit: BoxFit.contain,
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

//SIDEiMAGEVIEWER
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Gallery',
//       home: ImageGalleryScreen(),
//     );
//   }
// }
//
// class ImageGalleryScreen extends StatefulWidget {
//   @override
//   _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
// }
//
// class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
//   List<String> _imageUrls = [];
//   List<String> _imageNames = [];
//   int _selectedImageIndex = -1;
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
//       String imageName = imageRef.name;
//       setState(() {
//         _imageUrls.add(downloadURL);
//         _imageNames.add(imageName);
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
//           : Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: ListView.builder(
//               itemCount: _imageNames.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_imageNames[index]),
//                   onTap: () {
//                     setState(() {
//                       _selectedImageIndex = index;
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: _selectedImageIndex == -1
//                 ? Center(child: Text('Tap an image name to view'))
//                 : BookFlipAnimation(
//               images: _imageUrls,
//               initialIndex: _selectedImageIndex,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BookFlipAnimation extends StatefulWidget {
//   final List<String> images;
//   final int initialIndex;
//
//   const BookFlipAnimation({Key? key, required this.images, required this.initialIndex}) : super(key: key);
//
//   @override
//   _BookFlipAnimationState createState() => _BookFlipAnimationState();
// }
//
// class _BookFlipAnimationState extends State<BookFlipAnimation> {
//   late PageController _pageController;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentPage = widget.initialIndex;
//     _pageController = PageController(initialPage: _currentPage);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   void _onPageChanged(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: widget.images.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: _pageController,
//             builder: (context, child) {
//               double value = 1.0;
//               if (_pageController.position.haveDimensions) {
//                 value = _pageController.page! - index;
//                 value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.4);
//               }
//               // Apply scaling animation to the image
//               return Transform.scale(
//                 scale: 1.1 - (value.abs() * 0.1), // Adjust scaling factor as needed
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(5),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0),
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         child: child,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//             child: Image.network(
//               widget.images[index],
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      home: ImageGalleryScreen(),
    );
  }
}

class ImageGalleryScreen extends StatefulWidget {
  @override
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  List<String> _imageUrls = [];
  List<String> _imageNames = [];
  List<String> _displayNames = [
    "दूर जाना है हमको",
    "मै पूजूं तुझको",
    "रूठा ना कीजिए",
    "लीडर नहीं बदले",
    "बनवास राम का",
    "दीपक उम्मीद के",
    "कोशिश बहुत की",
    "सांप को दूध पिलाने निकले",
  ]; // List to store display names

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
      String imageName = imageRef.name;

      // Add original image name to _imageNames
      _imageNames.add(imageName);

      // Use your logic here to set the desired display name
      String displayName = _getDisplayName(imageName); // Implement your logic to change the name

      setState(() {
        _imageUrls.add(downloadURL);
        _displayNames.add(displayName); // Store the display name in a separate list
      });
    }
  }

  String _getDisplayName(String imageName) {
    // Implement your logic here to change the image name for display
    // For example, you could change the extension or remove specific characters
    return imageName.replaceAll('.jpg', ''); // Sample logic (remove .jpg extension)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: _displayNames.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _displayNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_displayNames[index]), // Show custom names here
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImage(
                    imageUrl: _imageUrls[index],
                    initialIndex: index,
                    images: _imageUrls,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final int initialIndex;
  final List<String> images;

  const FullScreenImage({Key? key, required this.imageUrl, required this.initialIndex, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookFlipAnimation(
        images: images,
        initialIndex: initialIndex,
      ),
    );
  }
}

class BookFlipAnimation extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const BookFlipAnimation({Key? key, required this.images, required this.initialIndex}) : super(key: key);

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
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}

