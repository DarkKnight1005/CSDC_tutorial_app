import 'package:flutter/material.dart';
import 'package:myapp/models/reponses/monument_response.dart';
import 'package:myapp/services/explore_service.dart';
import 'package:myapp/ui/screens/login_screen.dart';
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

  GlobalKey<LoginScreenState> loginScreenKey = GlobalKey<LoginScreenState>();

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
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("CSDC"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                loginScreenKey.currentState!.submitForm();
              },
              child: Text("Execute Internal Function")
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Container(
              width: double.infinity,
              height: 10,
              color: Colors.red,
            ),
          ),
          LoginScreen(
            key: loginScreenKey,
          ),
          ],
        ),
      )
      // Center(
      //   child: ListView.builder(
      //     itemCount: monumentResponse.monuments.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return LabeledCard(
      //         labelMain: monumentResponse.monuments[index].name, 
      //         labelSecondary: monumentResponse.monuments[index].location,
      //         imageUrl: monumentResponse.monuments[index].photoUrl, 
      //       );
      //     },
      //   ),
      // )
    );
  }
}