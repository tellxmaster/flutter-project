import 'dart:convert';
import '../models/Mantenimiento.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class MantenimientoService {
  MantenimientoService();
  Future<List<Mantenimiento>?> getMantenimientos() async {
    List<Mantenimiento> result = [];

//ListViews, Grid, sensores
    try {
      var url =
          Uri.https('trifasic-backend-9bc1e.web.app', 'api/mantenimiento');
      var response = await http.get(url);
      developer.log('Request failed with status: ${response}');
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return result;
        } else {
          List<dynamic> ListBody = json.decode(response.body);
          for (var item in ListBody) {
            var NewMantenimiento = Mantenimiento.fromJson(item);
            result.add(NewMantenimiento);
          }
          return result;
        }
      } else {
        developer.log('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      developer.log(e.toString());
      return null;
    }
  }
}
