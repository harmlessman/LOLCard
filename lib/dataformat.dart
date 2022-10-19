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
      'champ01_play' : null,
      'champ01_icon' : null
    },
    'champ02' : {
      'champ02_rate' : null,
      'champ02_grade' : null,
      'champ02_play' : null,
      'champ02_icon' : null
    },
    'champ03' : {
      'champ03_rate' : null,
      'champ03_grade' : null,
      'champ03_play' : null,
      'champ03_icon' : null
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

