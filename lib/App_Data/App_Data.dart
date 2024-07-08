import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<String> apiData = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      http.Response response = await http.get(Uri.parse('https://app.giotheapp.com/api-sample'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print('Full API Response: $data');
        if (data is Map<String, dynamic>) {
          apiData = data.values.toList().cast<String>();
        } else {
          print('Unexpected data type');
        }
        print('Extracted API Data: $apiData');

        setState(() {});
      } else {
        print('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button action here
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/logo.png',
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
            const Text(
              'Order # 112096',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: apiData.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: apiData.length,
                itemBuilder: (context, index) {
                  var item = apiData[index];
                  return Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${index + 1}', // Display index number
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 2,
                          height: double.infinity,
                          color: Colors.red,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        Expanded(
                          child: Text(
                            '$item',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderScreen(),
  ));
}
