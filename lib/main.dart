import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("First Flutter"),
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
                borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset("assets/images/firstpic.jpg"),
              ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/firstpic.jpg",width: 120,height: 50,),
                    Center(child: Text("Hello World",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("G wagon",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
              ),





            ],
          ),

      ),

    );
  }
}
