import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model_classes.dart';

class AirportDataScreen extends StatefulWidget {
  @override
  _AirportDataScreenState createState() => _AirportDataScreenState();
}

class _AirportDataScreenState extends State<AirportDataScreen> {
  Map<String, List<Map<String, dynamic>>> apiData = {};
  String? error;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://fatima11.000webhostapp.com/test.php'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        setState(() {
          apiData = Map<String, List<Map<String, dynamic>>>.from(
            decodedData.map((key, value) => MapEntry(
              key,
              List<Map<String, dynamic>>.from(
                value.cast<Map<String, dynamic>>(),
              ),
            )),
          );
        });
      } else {
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        this.error = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airport Data App'),
      ),
      body: error != null
          ? Center(
           child: Text(
          error!,
          style: TextStyle(color: Colors.red),
        ),
      )
          : apiData.isEmpty
          ? Center(
           child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: apiData.length,
           itemBuilder: (context, index) {
          final tableName = apiData.keys.elementAt(index);
          final tableData = apiData[tableName];

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tableName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...tableData!.map(
                      (data) => ListTile(
                    title: Text(
                      '${data['AirportCode'] ?? data['AirlineName'] ??data['AircraftType']??
                          data['DepartureAirportCode']?? data['Position'] ?? data['CheckTime']??data['PassengerID']??"N/A"}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    subtitle: Text(
                      '${data['Location'] ??  data['AirlineCode']?? data['FlightNumber']??
                          data['FirstName']??  "N/A"}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
