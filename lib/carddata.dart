class CardData {
  String? userName;
  String? userIcon;
  String? lane;
  int? userLevel;

  String? tier;
  int? rate;
  int? win;
  int? loss;
  int? lp;

  Map<String, dynamic>? mostChampions = {
    'champ0': {
      'champRate': 0,
      'champGrade': [],
      'champPlay': 0,
      'champIcon': '',
      'champName': ''
    },
    'champ1': {
      'champRate': 0,
      'champGrade': [],
      'champPlay': 0,
      'champIcon': '',
      'champName': ''
    },
    'champ2': {
      'champRate': 0,
      'champGrade': [],
      'champPlay': 0,
      'champIcon': '',
      'champName': ''
    },
  };

  CardData({
    this.userName = '',
    this.userIcon = '',
    this.lane = 'All Rounder',
    this.userLevel = 0,
    this.tier = 'Unranked',
    this.rate = 0,
    this.win = 0,
    this.loss = 0,
    this.lp = 0,
    this.mostChampions,
  });

  printInfo() {
    print('userName : $userName');
    print('userIcon : $userIcon');
    print('lane : $lane');
    print('userLevel : $userLevel');
    print('tier : $tier');
    print('lp : $lp');
    print('rate : $rate');
    print('win : $win');
    print('loss : $loss');
    print('mostChampions : $mostChampions');
  }
}
