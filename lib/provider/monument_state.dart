import 'package:flutter/material.dart';
import 'package:myapp/models/reponses/monument_response.dart';

class MonumentState extends ChangeNotifier{
  MonumentResponse _monumentData = MonumentResponse(monuments: []);

  set monumentData(MonumentResponse newMonumentData){
    _monumentData = newMonumentData;
    notifyListeners();
  }

  MonumentResponse get monumentData => _monumentData;
}

