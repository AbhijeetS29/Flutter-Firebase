import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart';

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

class ImageGalleryScreen extends StatefulWidget {
  @override
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  List<String> _imageUrls = []; // List to store image URLs
  int _currentIndex = 0;

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
      body: _imageUrls.isEmpty
          ? Center(child: CircularProgressIndicator())
          : BookFlipAnimation(images: _imageUrls, initialIndex: _currentIndex),
    );
  }
}
