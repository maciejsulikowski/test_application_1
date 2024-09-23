import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RandomColorScreen(),
    );
  }
}

class RandomColorScreen extends StatefulWidget {
  const RandomColorScreen({
    super.key,
  });

  @override
  State<RandomColorScreen> createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {
  Color currentColor = Colors.white;

  void generateRandomColor() {
    setState(() {
      final int randomNumber = DateTime.now().microsecondsSinceEpoch % 16777216;

      final int r = (randomNumber >> 16) & 0xFF;

      final int g = (randomNumber >> 8) & 0xFF;

      final int b = randomNumber & 0xFF;

      currentColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: generateRandomColor,
        child: Scaffold(
          backgroundColor: currentColor,
          body: Center(
            child: currentColor == Colors.white
                ? const TextWidget(
                    textColor: Colors.black,
                  )
                : const TextWidget(
                    textColor: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.textColor,
    super.key,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello there',
      style: TextStyle(color: textColor),
    );
  }
}
