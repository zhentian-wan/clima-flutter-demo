import 'package:clima/utilities/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'c3c525befcbaca3174faa37546872b62';
const weatherAPI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper net = NetworkHelper(
        '$weatherAPI?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');
    var jsonData = await net.getData();
    return jsonData;
  }

  Future<dynamic> getCityWeather(String name) async {
    var url = '$weatherAPI?q=$name&appid=$apiKey&units=metric';
    NetworkHelper net = NetworkHelper(url);
    var jsonData = await net.getData();
    return jsonData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
