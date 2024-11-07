import 'package:what3words/what3words.dart';
import 'package:http/http.dart' as http;

class What3WordsService {
  final api = What3WordsV3('');  

  Future<bool> _checkNetworkConnection() async {
    try {
      print('Checking network connection...');
      final response = await http.get(Uri.parse('https://api.what3words.com/v3/convert-to-3wa'));
      print('Network check status code: ${response.statusCode}');
      return response.statusCode != null;
    } catch (e) {
      print('Network check failed: $e');
      return false;
    }
  }

  Future<String?> convertToWords(double lat, double long) async {
    try {
      if (!await _checkNetworkConnection()) {
        print('No network connection available');
        return null;
      }

      print('Starting conversion for coordinates: $lat, $long');
      final coordinates = Coordinates(lat, long);
      
      var response = await api.convertTo3wa(coordinates).execute(); 

      if (!response.isSuccessful()) {
        print('API Error Code: ${response.error()?.code}');
        print('API Error Message: ${response.error()?.message}');
        return null;
      }

      var data = response.data();
      var words = data?.words;
      print('Words from API: $words');
      return words;

    } catch (e) {
      print('Error converting coordinates: $e');
      return null;
    }
  }
} 