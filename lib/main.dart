import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(const PasswordGeneratorApp());
}

class PasswordGeneratorApp extends StatelessWidget {
  const PasswordGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Password Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const PasswordGeneratorScreen(),
    );
  }
}

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  State<PasswordGeneratorScreen> createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState
    extends State<PasswordGeneratorScreen> {

  final baseController = TextEditingController();
  final lengthController = TextEditingController(text: "12");

  String generatedPassword = "";

  final Random random = Random();

  final Map<String, String> leetMap = {
    'a': '@',
    'e': '3',
    'i': '!',
    'o': '0',
    's': '\$',
    't': '7',
  };

  String generatePassword(String baseWord, int length) {

    const symbols = "!@#\$%^&*";
    const numbers = "0123456789";

    if (baseWord.isEmpty) return "";

    String transformed = "";

    for (int i = 0; i < baseWord.length; i++) {

      String char = baseWord[i];
      String lower = char.toLowerCase();

      if (leetMap.containsKey(lower)) {
        transformed += leetMap[lower]!;
      } else {
        transformed += char;
      }
    }

    transformed =
        transformed[0].toUpperCase() +
        transformed.substring(1);

    if (transformed.length > length - 2) {
      transformed =
          transformed.substring(0, length - 2);
    }

    String result =
        transformed +
        symbols[random.nextInt(symbols.length)] +
        numbers[random.nextInt(numbers.length)];

    while (result.length < length) {
      result += numbers[random.nextInt(numbers.length)];
    }

    return result;
  }

  void generate() {

    int length =
        int.tryParse(lengthController.text) ?? 12;

    if (length < 6) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Length must be at least 6"),
        ),
      );

      return;
    }

    setState(() {
      generatedPassword =
          generatePassword(baseController.text, length);
    });
  }

  void reset() {

    setState(() {

      baseController.clear();
      lengthController.text = "12";
      generatedPassword = "";

    });
  }

  void copy() {

    if (generatedPassword.isEmpty) return;

    Clipboard.setData(
      ClipboardData(text: generatedPassword),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password copied"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Smart Password Generator"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: TextField(
                  controller: baseController,
                  decoration: const InputDecoration(
                    labelText: "Base Word",
                    prefixIcon: Icon(Icons.edit),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: TextField(
                  controller: lengthController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Password Length",
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: generate,
                    child: const Text("Generate"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: reset,
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (generatedPassword.isNotEmpty)
              Card(
                color: Colors.green.shade50,
                child: ListTile(
                  title: Text(
                    generatedPassword,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "monospace",
                    ),
                  ),
                  subtitle:
                      Text("Length: ${generatedPassword.length}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: copy,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}