import 'package:api_graphics/api/apiservice.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:api_graphics/model/profile.dart';


class LinealScreen extends StatefulWidget {
  LinealScreen({Key key}) : super(key: key);

  @override
  _LinealScreenState createState() => _LinealScreenState();
}

class _LinealScreenState extends State<LinealScreen> {
  ApiService apiService;
  List<charts.Series<Materias, int>> datos;
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
            return simpleLinealChart();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget simpleLinealChart() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: Center(
                child: charts.LineChart(
                  datos,
                  animate: animate,
                  
                ),
        ),
      ),
    );
  }

  createSerie(List<Materias> list){
    datos = [
      charts.Series<Materias, int>(
        id: 'Grafica Lineal',
        data: list,
        domainFn: (Materias materia, _) => materia.calificacion,
        measureFn: (Materias materia, _) => materia.calificacion,
        
      )
    ];
    
  }
  
}
