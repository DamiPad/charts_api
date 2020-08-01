import 'package:api_graphics/model/profile.dart';
import 'package:http/http.dart' show Client;

class ApiService{
  final String baseUrl = "https://materiasg20200731030354.azurewebsites.net";
  Client client = Client();

  Future<List<Materias>> getMaterias() async{
    final response = await client.get('$baseUrl/api/Materias');
    if(response.statusCode == 200){
      return materiasFromJson(response.body);
    }
    else {
      return null;
    }
  }

  Future<bool> createMaterias(Materias data) async{
    final response = await client.post(
      "$baseUrl/api/Materias",
      headers: {"content-type": "application/json"},
      body: materiasToJson(data),
    );

    if(response.statusCode == 201){
      return true;
    }
    else{
      return false;
    }

  }


  Future<bool> updateMaterias(Materias data) async{
    final response = await client.put(
        "$baseUrl/api/Materias/${data.id}",
        headers: {"content-type":"application/json"},
         body: materiasToJson(data),
    );

    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
    
  }

  Future<bool> deleteMaterias(int id) async{
    final response = await client.delete(
        '$baseUrl/api/Materias/$id',
        headers: {"content-type":"application/json"},
    );

    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
    
  }



}
