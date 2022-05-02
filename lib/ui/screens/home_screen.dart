import 'package:flutter/material.dart';
import 'package:myapp/models/reponses/monument_response.dart';
import 'package:myapp/services/explore_service.dart';
import 'package:myapp/ui/widgets/label_box.dart';
import 'package:myapp/ui/widgets/labled_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  ExploreService exploreService = ExploreService();

  MonumentResponse monumentResponse = MonumentResponse(monuments: []);

  @override
  void initState(){
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async{
    monumentResponse = await exploreService.getMonuments();
    setState(() {
      
    });
    debugPrint(monumentResponse.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSDC"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: monumentResponse.monuments.length,
          itemBuilder: (BuildContext context, int index) {
            return LabeledCard(
              labelMain: monumentResponse.monuments[index].name, 
              labelSecondary: monumentResponse.monuments[index].location,
              imageUrl: monumentResponse.monuments[index].photoUrl, 
            );
          },
        ),
      )
    );
  }
}