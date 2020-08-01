import 'package:api_graphics/api/apiservice.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:api_graphics/model/profile.dart';


class BarrasHScreen extends StatefulWidget {
  BarrasHScreen({Key key}) : super(key: key);

  @override
  _BarrasHScreenState createState() => _BarrasHScreenState();
}

class _BarrasHScreenState extends State<BarrasHScreen> {
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
            return simpleBarHChart();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget simpleBarHChart() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: Center(
                child: charts.BarChart(
                  datos,
                  animate: animate,
                  vertical: false,
                ),
        ),
      ),
    );
  }

  createSerie(List<Materias> list){
    datos = [
      charts.Series<Materias, String>(
        id: 'Grafica de Barras Horizontal',
        data: list,
        domainFn: (Materias materia, _) => materia.nombre,
        measureFn: (Materias materia, _) => materia.calificacion,
        
      )
    ];
    
  }
  
}


