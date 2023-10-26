class Bangkok{
  final String city;
  final String country;
  final double id;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  final String description;
  final String lastUpdated;

  Bangkok({
    required this.city,
    required this.country,
    required this.id,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.description,
    required this.lastUpdated,
  });

  factory Bangkok.fromJson(Map<String, dynamic> json) {
    return  Bangkok(
      city: json['city'],
      country: json['country'],
      id: json['id'],
      tempC: json['tempC'],
      tempF: json['tempF'],
      feelsLikeC: json['feelsLikeC'],
      feelsLikeF: json['feelsLikeF'],
      windKph: json['windKph'],
      windMph: json['windMph'],
      humidity: json['humidity'],
      uv: json['uv'],
      description: json['description'],
      lastUpdated: json['lastUpdated'],

    );
  }
}
