import 'package:crona_app/services/app_services.dart';
import 'package:crona_app/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountry();
}

class _SearchCountry extends State<SearchCountry> {
  final TextEditingController searchController = TextEditingController();
  final WorldCase worldCase = WorldCase();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xff3bebd3),
          title: const Text(
            "Search Country Name",
            style: TextStyle(fontFamily: 'Ubuntu-Bold'),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {}); 
                },
                decoration: InputDecoration(
                  hintText: "Search....",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
        
            Expanded(
             child: FutureBuilder(
              future: worldCase.countryhdata(), 
              builder: (context , AsyncSnapshot<List<dynamic>> snapshot){
            
                if(!snapshot.hasData){
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return  Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                height: 10,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey
                                ),
                                
                              ),
                            ),
                            subtitle: SizedBox(
                              height: 20,
                              width: 200,
                            ),
                          )
                      ],
                      )
                      );
                      
                    },
              
                  );
                }
                else{
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder:(context, index) {
                        String name = snapshot.data![index]['country'];
            
                        if(searchController.text.isEmpty){
                           return Column(
                          children: [
                            
                            GestureDetector(
                              onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                        
                                        name: snapshot.data![index]['country'], 
                                         flag: snapshot.data![index]['countryInfo']['flag'],
                                         cases: snapshot.data![index]['cases'],
                                         tests: snapshot.data![index]['tests'],
                                         recover: snapshot.data![index]['recovered'],
                                         deaths: snapshot.data![index]['deaths'],


                                      
                                       )));
                                    },
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                
                                  child: Text(

                                    snapshot.data![index]['country'],
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu-Bold',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    
                                  ),
                                ),
                                leading: CircleAvatar(
                                  
                                  backgroundImage: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']
                                  ),
                                  radius: 30,
                                ),
                              ),
                            )
                          ],
                        );
                        }
                        else if(name.toLowerCase().contains(searchController.text.toLowerCase())){

                           return Column(
                          children: [
                            
                            GestureDetector(
                              
                              onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                         name: snapshot.data![index]['country'], 
                                         flag: snapshot.data![index]['countryInfo']['flag'],
                                         cases: snapshot.data![index]['cases'],
                                         tests: snapshot.data![index]['tests'],
                                         recover: snapshot.data![index]['recovered'],
                                         deaths: snapshot.data![index]['deaths'],

                                        
                                      )
                                      
                                      ));
                                    },
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),                            
                                  child: Text(
                                    snapshot.data![index]['country'],
                                    
                                  ),
                                ),
                                leading: CircleAvatar(
                                  
                                  backgroundImage: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']
                                  ),
                                  radius: 30,
                                ),
                              ),
                            )
                          ],
                        );
            
                        }
                        else{
                          return Container();
            
                        }
                       
                      },),
                  );
                  
                }
            
              }
              ),
            )
        
        
        
            
          ],
        
        ),
      ),
    );
  }
}