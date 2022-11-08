class CardData{
  // final String userName;
  // final String userIcon;
  // final String lane;
  // final int userLevel;
  //
  // final String tier;
  // final int rate;
  // final int win;
  // final int loss;
  // final int lp;

  String? userName;
  String? userIcon;
  String? lane;
  int? userLevel;

  String? tier;
  int? rate;
  int? win;
  int? loss;
  int? lp;



  Map<String, dynamic>? mostChampions ={
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


  CardData({
    this.userName,
    this.userIcon,
    this.lane,
    this.userLevel,
    this.tier,
    this.rate,
    this.win,
    this.loss,
    this.lp,
    this.mostChampions,
  });


  CardData.fromJson(Map<String, dynamic> json){
    userName = json['userName'];
    tier = json['tier'];
    lane = json['lane'];
    rate = json['rate'];
    win = json['win'];
    loss = json['loss'];
    userIcon = json['iconImagePath'];
    mostChampions = json['mostChampions'];
    lp = json['lp'];
    userLevel = json['userLevel'];

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
      'iconImagePath' : userIcon,
      'mostChampions' : mostChampions,
      'userLevel' : userLevel,
      'lp' : lp,
      'userIcon' : userIcon,
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