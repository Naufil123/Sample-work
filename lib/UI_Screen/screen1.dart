import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<String> apiData = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      http.Response response =
      await http.get(Uri.parse('https://app.giotheapp.com/api-sample'));
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
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/logo.png',
            height: 100,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order # 112096',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/screen2');
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: apiData.length,
                itemBuilder: (context, index) {
                  var item = apiData[index];
                  bool showCameraIcon = selectedIndex == index;
                  return GestureDetector(
                    onLongPressStart: (details) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    onLongPressEnd: (details) {
                      setState(() {
                        selectedIndex = -1;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
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
                            margin: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Expanded(
                            child: Text(
                              '$item',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          if (showCameraIcon)
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.camera_alt, color: Colors.black),
                            ),
                        ],
                      ),
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
