import 'package:flutter/material.dart';



class PageCurlScreen extends StatefulWidget {
  @override
  _PageCurlScreenState createState() => _PageCurlScreenState();
}

class _PageCurlScreenState extends State<PageCurlScreen> {
  final List<String> imagePaths = [
    "assets/images/firstpic.jpg",
    "assets/images/second.jpg",
    // Add more image paths as needed
  ];

  double curlValue = 0.0;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Curl Effect'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            curlValue += details.delta.dx / MediaQuery.of(context).size.width;
            if (curlValue > 1.0) {
              curlValue = 1.0;
            } else if (curlValue < 0.0) {
              curlValue = 0.0;
            }
          });
        },
        onPanEnd: (_) {
          setState(() {
            if (curlValue > 0.5) {
              currentPageIndex = (currentPageIndex + 1) % imagePaths.length;
            }
            curlValue = 0.0;
          });
        },
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: PageCurlPainter(curlValue),
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    color: Colors.blueGrey, // Change this to represent the page content
                    child: Center(
                      child: Image.asset(
                        imagePaths[currentPageIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageCurlPainter extends CustomPainter {
  final double curlValue;

  PageCurlPainter(this.curlValue);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final pagePath = Path()
      ..moveTo(size.width * curlValue, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * curlValue, size.height)
      ..quadraticBezierTo(
          size.width * curlValue, size.height / 2, size.width, size.height / 2)
      ..close();

    final gradient = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Colors.white.withOpacity(0.0), Colors.white.withOpacity(1.0)],
    );

    canvas.saveLayer(rect, Paint());
    canvas.drawPath(pagePath, Paint()..shader = gradient.createShader(rect));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
