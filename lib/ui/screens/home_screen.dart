import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/reponses/monument_response.dart';
import 'package:myapp/provider/monument_state.dart';
import 'package:myapp/services/explore_service.dart';
import 'package:myapp/ui/screens/login_screen.dart';
import 'package:myapp/ui/widgets/label_box.dart';
import 'package:myapp/ui/widgets/labled_card.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with AfterLayoutMixin<HomeScreen>{
  ExploreService exploreService = ExploreService();

  // late MonumentState monumentState;

  GlobalKey<LoginScreenState> loginScreenKey = GlobalKey<LoginScreenState>();

  Future<void> fetchData(BuildContext context) async{
    MonumentResponse monumentResponse = await exploreService.getMonuments();
    // monumentState.monumentData = monumentResponse;
    context.read<MonumentState>().monumentData = monumentResponse;
    debugPrint(monumentResponse.toString());
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // monumentState = Provider.of<MonumentState>(context);
    fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    // monumentState = Provider.of<MonumentState>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("CSDC"),
      ),
      body: SingleChildScrollView(
        child:  Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
          child: Consumer<MonumentState>(
            builder: (context, MonumentState monumentState, _) {
            return monumentState.monumentData.monuments.isNotEmpty 
            ? ListView.builder(
              itemCount: monumentState.monumentData.monuments.length,
              itemBuilder: (BuildContext context, int index) {
                return LabeledCard(
                  labelMain: monumentState.monumentData.monuments[index].name, 
                  labelSecondary: monumentState.monumentData.monuments[index].location,
                  imageUrl: monumentState.monumentData.monuments[index].photoUrl, 
                );
              },
            )
            : CircularProgressIndicator();
            }
          )
      ),
        )
      )
     
    );
  }

 
}
