import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navigation with Get X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/pagethree', page: () => const PageThree()),
        GetPage(name: '/pagefour/:data', page: () => const PageFour()),
      ],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation with Get X'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.to(const PageOne(), arguments: {'id': '1'}),
              child: Text('Go to Page One'),
            ),
            ElevatedButton(
              onPressed: () => Get.off(
                const PageTwo(),
              ), // Cannto go back (no back button)
              child: Text('Go to Page Two'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(
                '/pagethree',
                arguments: {'name': 'DART'},
              ), // Named Route
              child: Text('Go to Page Three'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(
                  '/pagefour/DART'), // Name Route with data in the route
              child: Text('Go to Page Two'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page One')),
      body: Center(
        child: Container(
          child: Text(Get.arguments['id'] ?? 'Page One'),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Two')),
      body: Center(
          child: Container(
        child: ElevatedButton(
          child: Text('Go back to Home'),
          onPressed: () => Get.off(const HomePage()),
        ),
      )),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Three')),
      body: Center(
          child: Container(
        child: Text(Get.arguments['name']),
      )),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Four'),
      ),
      body: Center(
          child: Container(
        child: Text(Get.parameters['data'] ?? 'Page Four'),
      )),
    );
  }
}
