import 'package:crona_app/model/model_case.dart';
import 'package:crona_app/services/app_services.dart';
import 'package:crona_app/view/country_state.dart';
import 'package:crona_app/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WorldCase worldCase = WorldCase();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          FutureBuilder(
            future: worldCase.fetchdata(),
             builder: (context,AsyncSnapshot <CaseModel> snapshot){
              if(!snapshot.hasData){
                return Expanded(
                  flex: 1,
                  child :SpinKitFadingCircle(
                    color: Color(0xff3bebd3),
                    size: 40,  
                    duration: Duration(milliseconds: 1200),             
                  )
                  );
              }
              else{
                return Column(
                  children: [
                    SizedBox(height: 30,),
                    PieChart(
                                dataMap: {
                                 'Total Case' : double.parse(snapshot.data!.cases!.toString()),
                                 'Recoverd' : double.parse(snapshot.data!.recovered!.toString()),
                                 'Deaths' : double.parse(snapshot.data!.deaths!.toString()),
                                },
                                animationDuration: Duration(seconds: 2),
                                chartType: ChartType.ring,
                                chartRadius: 150,
                                legendOptions: LegendOptions(
                                  legendPosition: LegendPosition.right,
                                ),
                                colorList: [
                                  const Color.fromARGB(255, 56, 144, 226),
                                  const Color.fromARGB(255, 241, 255, 113),
                                  Colors.red
                                ],
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                ),),
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    CustomTile(name: 'Total Tests', number: snapshot.data!.tests!),
                                    CustomTile(name: 'Affetcted Countries', number: snapshot.data!.affectedCountries!),
                                    CustomTile(name: 'Total Cases', number: snapshot.data!.cases!),
                                    CustomTile(name: 'Recover Cases', number: snapshot.data!.recovered!),
                                    CustomTile(name: 'Total Deaths', number: snapshot.data!.deaths!),
                                  ],
                                ),

                               GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCountry()));
                                      },
                                       child: Container(
                                         height: 50,
                                         width: 350,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           color: Color(0xff3bebd3),
                                         ),
                                         child: Center(
                                           child: Text(
                                            'Serach Country',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu-Bold',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600
                                            ),
                                           ),
                                         ),
                                       ),
                                     )
                  ],
                );
              }
             },
          ),
        
        ],
      ),
      
    );
  }
}