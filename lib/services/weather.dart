import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const weatherMapApiKey = 'c74e838ce00adf67956fa41c07683ead';
const weatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(city) async {
    var url = '$weatherMapUrl?q=$city&appid=$weatherMapApiKey&units=metric';

    var data = await NetworkHelper(url).getData();

    return data;
  }

  Future<dynamic> getWeatherData() async {
    var location = Location();
    await location.getCurrentLocation();

    var url =
        '$weatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$weatherMapApiKey&units=metric';

    var data = await NetworkHelper(url).getData();

    return data;
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
