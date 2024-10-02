import 'dart:convert';

import 'package:http/http.dart' as http;

final String _token = "15488|HtV3j9yqFlOmL9rAg0ReY9FdrUJhfeiw";

Future<Map> converteNumeroPorExtenso(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> buscaCep(String? _cep) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_cep?token=$_token"));
  return json.decode(response.body);
}

Future<Map> localizaIp(String? _ip) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/geoip/$_ip?token=$_token"));
  return json.decode(response.body);
}