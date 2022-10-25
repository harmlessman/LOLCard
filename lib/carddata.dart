import 'dart:convert';


class CardData{
  String? userName;
  TierList? tier;
  Lane? lane;
  int? rate;
  String? iconImagePath;
  int? win;
  int? loss;

  Map<String, dynamic> mostChampions ={
    'champ01' : {
      'champ01Rate' : null,
      'champ01Grade' : null,
      'champ01Play' : null,
      'champ01Icon' : null
    },
    'champ02' : {
      'champ02Rate' : null,
      'champ02Grade' : null,
      'champ02Play' : null,
      'champ02Icon' : null
    },
    'champ03' : {
      'champ03Rate' : null,
      'champ03Grade' : null,
      'champ03Play' : null,
      'champ03Icon' : null
    },

  };


  fromJson(Map<String, dynamic> json){
    userName = json[userName];
    tier = json[tier];
    lane = json[lane];
    rate = json[rate];
    win = json[win];
    loss = json[loss];
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
      'win' : win,
      'loss' : loss,
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

