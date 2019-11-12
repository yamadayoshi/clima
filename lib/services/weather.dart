import 'dart:core';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '54f66f9fede5dd94759e740c4fd9446f';
const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$weatherUrl?q=$cityName&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
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

  String getMessage(double temp) {
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
