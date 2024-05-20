// lib/services/exchange_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeService {
  static const String apiKey = '88e1543f984a2c7a0705949d'; // Buraya API anahtarınızı koyun
  static const String baseCurrency = 'USD';
  static const String targetCurrency = 'TRY';
  static const String url = 'https://v6.exchangerate-api.com/v6//latest/USD';

  static Future<String?> fetchExchangeRate() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['conversion_rates'][targetCurrency].toString();
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      print('Error fetching exchange rate: $e');
      return null;
    }
  }
}
