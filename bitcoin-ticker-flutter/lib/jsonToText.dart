import 'networking.dart';

const apiKey = '10D83F85-CD3B-4829-BDF6-017ECFAC0B3B';

class CoinValue {
  static Future<dynamic> _getCurrentRates(String from, String to) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://rest.coinapi.io/v1/exchangerate/$from/$to?apikey=$apiKey');
    return await networkHelper.getData();
  }

  static Future<String> valueText(String from, String to) async {
    dynamic value = await _getCurrentRates(from, to);
    double rate = value['rate'];
    return '1 ' + from + ' = ' + rate.toStringAsFixed(4) + ' ' + to;
  }
}
