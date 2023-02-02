import 'dart:io';

class AppConstance{
  static const String baseUrl ='https://api.openweathermap.org/data/2.5';
  static const String appKey ='8EA223A58BC575C1730f4EE4f7505347';

}
String getOs(){
  return Platform.operatingSystem;
}