import 'package:api_graphics/api/apiservice.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:api_graphics/model/profile.dart';


class PieScreen extends StatefulWidget {
  PieScreen({Key key}) : super(key: key);

  @override
  _PieScreenState createState() => _PieScreenState();
}

class _PieScreenState extends State<PieScreen> {
  ApiService apiService;
  List<charts.Series<Materias, String>> datos;
  final bool animate = false;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getMaterias(),
        builder: (BuildContext context, AsyncSnapshot<List<Materias>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            createSerie(snapshot.data);
            return simplepieChart();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget simplepieChart() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: Center(
                child: charts.PieChart(
                  datos,
                  animate: animate,
                  
                ),
        ),
      ),
    );
  }

  createSerie(List<Materias> list){
    datos = [
      charts.Series<Materias, String>(
        id: 'Grafica Lineal',
        data: list,
        domainFn: (Materias materia, _) => materia.nombre,
        measureFn: (Materias materia, _) => materia.calificacion,
        labelAccessorFn: (Materias materia, _) =>'${materia.nombre} :${materia.calificacion}'
      
        
      )
    ];
    
  }
  
}




