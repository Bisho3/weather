class Weather {
  final int id;
  final String cityName;
  final String main;
  final String description;
  final int pressure;
  final double temp;
  final double tempMax;
  final double tempMin;
  final int humidity;

  Weather({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.pressure,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.humidity
  });
}
