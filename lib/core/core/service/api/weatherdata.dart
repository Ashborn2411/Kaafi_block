// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

// import 'locationtimecontroller.dart';
// import '../../data/models/weathermodel.dart';
// import '../../modules/constants/constants/string_const.dart';

// class WeatherService {
//   Future<Weathemodel> getCurrentWeather() async {
//     final position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.best,
//     );
//     var link =
//         "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${StringConst.apiKey}&units=metric";
//     var res = await http.get(Uri.parse(link));

//     if (res.statusCode == 200) {
//       var data = weathemodelFromJson(res.body.toString());
//       return data;
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }
// }
