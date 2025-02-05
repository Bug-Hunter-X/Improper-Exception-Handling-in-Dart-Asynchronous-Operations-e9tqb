```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the response
      final jsonData = jsonDecode(response.body);
      // Access and use the data from jsonData
      print(jsonData);
    } else {
      // Handle non-200 status codes
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (network errors, decoding errors)
    print('Error: $e');
    //Consider rethrowing the exception if you want to handle this in the caller function
    rethrow; //This will throw the exception up to the caller function
  }
}
```