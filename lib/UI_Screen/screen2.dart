import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/screen1');
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/logo.png', // Add your logo asset here
            height: 60,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Order# ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: "\t\t112096",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Order name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: "\t\tJoe's catering",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Delivery date",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: "\t\tMay 4th 2024",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Total quantity",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: "\t\t38",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Estimated total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: "\t\t\$1402.96",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Location',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                  ),
                  TextSpan(
                    text: "\t\t355 Onderdonk St, Marina Dubai, UAE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Delivery instructions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Delivery instructions...',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button action here
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00796B), // Button color
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle save as draft action here
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF00796B), // Text color
                ),
                child: const Text('Save as draft'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
