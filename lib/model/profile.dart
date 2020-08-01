import 'dart:convert';

class Materias{
  int id;
  String nombre;
  String profesor;
  String cuatrimestre;
  String horario;
  int calificacion;

  Materias({
    this.id,
    this.nombre,
    this.profesor,
    this.cuatrimestre,
    this.horario,
    this.calificacion

  });

  factory Materias.fromJson(Map<String, dynamic> map){
    return Materias(
      id: map['Id'],
      nombre: map['Nombre'],
      profesor: map['Profesor'],
      cuatrimestre: map['Cuatrimestre'],
      horario: map['Horario'],
      calificacion: map['Calificacion']
    );
  }

  Map<String, dynamic>toJson(){
    return {"Id": id, 
            "Nombre": nombre, 
            "Profesor":profesor, 
            "Cuatrimestre":cuatrimestre,
            "Horario": horario,
            "Calificacion": calificacion
          };
  }


  @override
  String toString(){
    return 'Materias{Id:$id, Nombre:$nombre, Profesor:$profesor, Cuatrimestre:$cuatrimestre, Horario:$horario, Calificacion:$calificacion}';
  }
}


List<Materias> materiasFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Materias>.from(data.map((item)=>
  Materias.fromJson(item)));

}

String materiasToJson(Materias data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}