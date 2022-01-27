import 'dart:io';

Future checkInternetConn() async {
  try {
    final response = await InternetAddress.lookup('openweathermap.org');
    if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (e) {
    return false;
  }
}
