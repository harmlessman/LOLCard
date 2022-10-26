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
    'champ0' : {
      'champ0Rate' : 0,
      'champ0Grade' : [],
      'champ0Play' : 0,
      'champ0Icon' : '',
      'champ0Name' : ''
    },
    'champ1' : {
      'champ1Rate' : 0,
      'champ1Grade' : [],
      'champ1Play' : 0,
      'champ1Icon' : '',
      'champ1Name' : ''
    },
    'champ2' : {
      'champ2Rate' : 0,
      'champ2Grade' : [],
      'champ2Play' : 0,
      'champ2Icon' : '',
      'champ2Name' : ''
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

