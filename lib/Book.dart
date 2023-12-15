import 'package:flutter/material.dart';

class BookPageTurnAnimation extends StatefulWidget {
  @override
  _BookPageTurnAnimationState createState() => _BookPageTurnAnimationState();
}

class _BookPageTurnAnimationState extends State<BookPageTurnAnimation> {
  PageController _pageController = PageController(initialPage: 0);
  bool _isAnimating = false;
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Page Animation'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Image.asset('assets/images/firstpic.jpg'),
              Image.asset('assets/images/second.jpg'),
              Image.asset('assets/images/firstpic.jpg'),
              // Add more images as needed
            ],
          ),
          GestureDetector(
            onPanStart: (_) {
              setState(() {
                _isAnimating = true;
              });
            },
            onPanEnd: (_) {
              setState(() {
                _isAnimating = false;
              });
            },
            onPanUpdate: (details) {
              if (_isAnimating) {
                double delta = details.delta.dx;
                if (delta > 0 && _currentPageValue > 0) {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 400), curve: Curves.ease);
                } else if (delta < 0 && _currentPageValue < 2 /* total number of pages */) {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 400), curve: Curves.ease);
                }
              }
            },
          ),
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = (_pageController.page ?? 0) - _currentPageValue;
                value = (1 - value.abs()).clamp(0.0, 1.0);
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(value * -0.5),
                  child: child,
                );
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
