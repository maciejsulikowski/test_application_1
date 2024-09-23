import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

/// Main class, i changed name here because problem appeared
class Main extends StatelessWidget {
  /// Main class, i changed name here because problem appeared
  const Main({super.key});
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

/// Separate class RandomColorScreen which generates color based on time
class RandomColorScreen extends StatefulWidget {
  /// Separate class RandomColorScreen which generates color based on time
  const RandomColorScreen({
    super.key,
  });

  @override
  State<RandomColorScreen> createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {
  ///Set our color for white at the beginning
  Color currentColor = Colors.white;

  ///Create method for random color generation
  void generateRandomColor() {
    ///setState method is used to refresh the state every time when user clicks
    setState(() {
      /// Generate a "random" number based on the current time in microseconds
      /// We limit it to 16,777,216 because it's the total number of RGB color
      /// combinations (256 * 256 * 256)
      final int randomNumber = DateTime.now().microsecondsSinceEpoch % 16777216;

      /// Extract the red component (first 8 bits)
      final int r = (randomNumber >> 16) & 0xFF;

      /// Extract the green component (next 8 bits)
      final int g = (randomNumber >> 8) & 0xFF;

      /// Extract the blue component (last 8 bits)
      final int b = randomNumber & 0xFF;
      // Combine the red, green, and blue values to create a new color
      currentColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  /// Show the screen and user can click to change the color and maybe text
  /// to see this text
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

/// Separate Widget, I put this here, because I didn't want to create new file,
/// at this case i think it's relevant method
class TextWidget extends StatelessWidget {
  /// Separate Widget
  const TextWidget({
    required this.textColor,
    super.key,
  });

  /// Color from text
  final Color textColor;

  /// Displaying text here
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello there',
      style: TextStyle(color: textColor),
    );
  }
}
