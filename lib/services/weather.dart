import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '5879679789cfbe3b60f84fecad148c15';
const url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getlocationWeather() async {
    Location location = Location();
    await location.getLocation();

    var latitude = location.latitude;
    var longitude = location.longitude;

    Networking network = Networking(
        url: '$url?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await network.getData();

    return weatherData;
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
