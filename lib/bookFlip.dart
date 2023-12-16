// import 'package:flutter/material.dart';
//
// class BookFlipAnimation extends StatefulWidget {
//   @override
//   _BookFlipAnimationState createState() => _BookFlipAnimationState();
// }
//
// class _BookFlipAnimationState extends State<BookFlipAnimation> {
//   late PageController _pageController;
//   int _currentPage = 0;
//
//   List<String> _imageList = [
//     'assets/images/firstpic.jpg', // Replace these with your image paths
//     'assets/images/second.jpg',
//     'assets/images/firstpic.jpg', // Replace these with your image paths
//     'assets/images/second.jpg',
//     // Add more image paths as needed
//   ];
//
//   @override
//   void initState() {
//     super.initState();
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
//       appBar: AppBar(title: Text('Book Flip Animation')),
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: _imageList.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: _pageController,
//             builder: (context, child) {
//               double value = 1.0;
//               if (_pageController.position.haveDimensions) {
//                 value = _pageController.page! - index;
//                 value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
//               }
//               return Center(
//                 child: SizedBox(
//                   width: Curves.easeOut.transform(value) * 300,
//                   height: Curves.easeOut.transform(value) * 400,
//                   child: child,
//                 ),
//               );
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 _imageList[index],
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';



// class BookFlipAnimation extends StatefulWidget {
//   @override
//   _BookFlipAnimationState createState() => _BookFlipAnimationState();
// }
//
// class _BookFlipAnimationState extends State<BookFlipAnimation> {
//   late PageController _pageController;
//   int _currentPage = 0;
//
//   List<String> _imageList = [
//     'assets/images/firstpic.jpg', // Replace these with your image paths
//     'assets/images/second.jpg',
//     'assets/images/firstpic.jpg', // Replace these with your image paths
//     'assets/images/second.jpg',
//     // Add more image paths as needed
//   ];
//
//   @override
//   void initState() {
//     super.initState();
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
//       appBar: AppBar(title: Text('Book Flip Animation')),
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: _imageList.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: _pageController,
//             builder: (context, child) {
//               double value = 1.0;
//               if (_pageController.position.haveDimensions) {
//                 value = _pageController.page! - index;
//                 value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
//               }
//               return Center(
//                 child: SizedBox(
//                   width: Curves.easeOut.transform(value) * 300,
//                   height: Curves.easeOut.transform(value) * 400,
//                   child: Transform.scale(
//                     scale: value,
//                     child: child,
//                   ),
//                 ),
//               );
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 _imageList[index],
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';

class BookPageCurl extends StatefulWidget {
  @override
  _BookPageCurlState createState() => _BookPageCurlState();
}

class _BookPageCurlState extends State<BookPageCurl>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentPage = 0;

  List<String> _imageList = [
    'assets/images/firstpic.jpg', // Replace these with your image paths
    'assets/images/second.jpg',
    'assets/images/firstpic.jpg', // Replace these with your image paths
    'assets/images/second.jpg',
    // Add more image paths as needed
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % _imageList.length;
    });
    _controller.forward(from: 0);
  }

  void _previousPage() {
    setState(() {
      _currentPage = (_currentPage - 1) % _imageList.length;
      if (_currentPage < 0) {
        _currentPage = _imageList.length - 1;
      }
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Curl Animation')),
      body: GestureDetector(
        onTap: _nextPage,
        onDoubleTap: _previousPage,
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: Size(300, 400),
                painter: PageCurlPainter(
                  angle: _controller.value * 0.5 * pi,
                  image: _imageList[_currentPage],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PageCurlPainter extends CustomPainter {
  final double angle;
  final String image;

  PageCurlPainter({required this.angle, required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawRect(Offset.zero & size, paint);

    canvas.saveLayer(Offset.zero & size, Paint());

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-angle);

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.8, 0)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    canvas.clipPath(path);

    final img = Image.asset(
      image,
      fit: BoxFit.cover,
      width: size.width.toDouble(),
      height: size.height.toDouble(),
    );

    img.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo info, bool _) {
          canvas.drawImageRect(
            info.image,
            Rect.fromLTRB(0, 0, info.image.width.toDouble(), info.image.height.toDouble()),
            Offset.zero & size,
            paint,
          );
        },
      ),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


