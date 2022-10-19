import 'dart:convert';


class CardData{
  String? userName;
  TierList? tier;
  Lane? lane;
  int? rate;
  String? iconImagePath;

  Map<String, dynamic>? mostChampions ={
    'champ01' : {
      'champ01_rate' : null,
      'champ01_grade' : null,
      'champ01_'
    },
    'champ02' : {

    },
    'champ03' : {

    },

  };


  readJson(Map<String, dynamic> json){
    userName = json[userName];
    tier = json[tier];
    lane = json[lane];
    rate = json[rate];
    iconImagePath = json[iconImagePath];
    mostChampions = json[mostChampions];
  }

  toJson(){
    Map<String, dynamic> json;
    json={
      'userName' : userName,
      'tier' : tier,
      'lane' : lane,
      'rate' : rate,
      'iconImagePath' : iconImagePath,
      'mostChampions' : mostChampions
    };
    return json;
  }

}

enum TierList{
  iron, bronze, sliver, gold, platinum, diamond, master, grandmaster, challenger
}

enum Lane{
  top, mid, jungle, adc, support
}

