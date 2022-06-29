class WeatherInfo {
  final String main;
  final String icon;

  WeatherInfo({required this.main, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    final icon = json['icon'];
    return WeatherInfo(main: main, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class HumidityInfo {
  final int humidity;

  HumidityInfo({required this.humidity});

  factory HumidityInfo.fromJson(Map<String, dynamic> json) {
    final humidity = json['humidity'];
    return HumidityInfo(humidity: humidity);
  }
}

class WindInfo {
  final double wind;

  WindInfo({required this.wind});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final wind = json['speed'];
    return WindInfo(wind: wind);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final HumidityInfo humidityInfo;
  final WindInfo windInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({
    required this.cityName,
    required this.tempInfo,
    required this.weatherInfo,
    required this.humidityInfo,
    required this.windInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final humidityInfoJson = json['main'];
    final humidityInfo = HumidityInfo.fromJson(humidityInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    return WeatherResponse(
      cityName: cityName,
      tempInfo: tempInfo,
      weatherInfo: weatherInfo,
      humidityInfo: humidityInfo,
      windInfo: windInfo,
    );
  }
}
