import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../../models/Bangkok.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // URL ของ API สภาพอากาศ
  final String apiUrl =
      'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=Bangkok';
  double temperature = 28.8; // ตัวแปรสำหรับเก็บอุณหภูมิ
  String description = "";
  String lastUpdated = "";

  // สร้างฟังก์ชันเรียกใช้งาน API สภาพอากาศ
  Future<void> getWeatherData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null && data['data'] != null) {
        final bangkokData = Bangkok.fromJson(data['data']);

        setState(() {
          temperature = bangkokData.tempC;
          description = bangkokData.description;
          lastUpdated = bangkokData.lastUpdated; // คุณต้องให้คลาส `Bangkok` มีคุณสมบัติ lastUpdated
        });
      } else {
        print('Invalid data format');
      }
    } else {
      print('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    String lastUpdated = "2023-10-26 10:00";  // เปลี่ยนเป็นวันที่และเวลาจริงจาก API
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');  // รูปแบบของวันที่และเวลา
    DateTime dateTime = dateFormat.parse(lastUpdated);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Center(
                    child: Text('Bangkok', textAlign: TextAlign.center),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Center(
                    child: Text('Paris', textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Text(
                    'Bangkok',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Thailand',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    lastUpdated,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.cloud, size: 48.0),
                      SizedBox(width: 8.0), // เพิ่มระยะห่างระหว่างไอคอนและคำอธิบาย
                      Column(
                        children: [
                         // ไอคอนตรงกลางแท็บ
                          Text(
                            'cloud', // แสดงคำอธิบายของสภาพอากาศ
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text(
                    'Temperature: $temperature°C', // แสดงอุณหภูมิ
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
