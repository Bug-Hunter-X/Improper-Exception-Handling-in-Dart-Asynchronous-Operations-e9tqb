```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      //Instead of throwing an exception, log the error and return null
      print('Error: HTTP request failed with status code ${response.statusCode}. Response body: ${response.body}');
      return null; //Return null to indicate failure
    }
  } catch (e, stacktrace) {
    // Log the error with stacktrace
    print('Error: $e. Stacktrace: $stacktrace');
    return null; //Return null to indicate failure
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data fetched successfully: $data');
  } else {
    print('Failed to fetch data.');
  }
}
```