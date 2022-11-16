import 'package:http/http.dart' as http;

import 'package:html/parser.dart';

import 'carddata.dart';

const ANO = '<!-- -->';

/*
css-1v663t e1x14w4w1 => 솔랭 티어, lp, 승, 패, 승률
css-e9xk5o e1g7spwk3 => 모스트 챔프
css-1d2nav3 eioz3425 => 유저 정보
 */
void main() async{
  dataCrawling('');

}

dynamic dataCrawling(String userName, {String server='kr'}) async{
  var url  = Uri.parse('https://www.op.gg/summoners/$server/$userName');

  http.Response re;

  // except error (normally network issue)
  try{
    re = await http.get(url);
  } catch(e){
    print('Network Error!');
    return 0;
  }

  var opggData = parse(re.body);

  print('response.statusCode = ${re.statusCode}');

  // op.gg server error
  if (re.statusCode/100 !=2) {
    return 1;
  }

  // an unregistered summoner
  if (opggData.getElementsByClassName('profile-icon').isEmpty){
    return 2;
  }

  // variable
  String? userIcon;
  String? lane;
  int? userLevel;

  String? tier;
  int? rate;
  int? win;
  int? loss;
  int? lp;


  Map<String, dynamic> mostChampions ={
    'champ0' : {
      'champRate' : 0,
      'champGrade' : [],
      'champPlay' : 0,
      'champIcon' : '',
      'champName' : ''
    },
    'champ1' : {
      'champRate' : 0,
      'champGrade' : [],
      'champPlay' : 0,
      'champIcon' : '',
      'champName' : ''
    },
    'champ2' : {
      'champRate' : 0,
      'champGrade' : [],
      'champPlay' : 0,
      'champIcon' : '',
      'champName' : ''
    },

  };



  var rankInfo = opggData.getElementsByClassName('css-1v663t e1x14w4w1')[0];
  var mostChampInfo = opggData.getElementsByClassName('css-e9xk5o e1g7spwk3')[0];
  //var userInfo = opggData.getElementsByClassName('css-1d2nav3 eioz3425')[0];

  int mostChampIen = mostChampInfo.querySelectorAll('img').length;


  if (mostChampIen>3){
    mostChampIen=3;
  }
  else if (mostChampIen==3){
    mostChampIen=2; // 맨 밑의 더보기 아이콘(img) 때문에
  }

  //mostChampInfo crawling
  for (int i=0; i<mostChampIen; i++){
    mostChampions['champ$i']['champIcon'] = (
        mostChampInfo.querySelectorAll('img')[i].attributes['src']);

    mostChampions['champ$i']['champName'] = (
        mostChampInfo.getElementsByClassName('name')[i].getElementsByTagName('a')[0].innerHtml);

    mostChampions['champ$i']['champPlay'] = (
        int.parse(mostChampInfo.getElementsByClassName('count')[i].innerHtml.split(ANO)[0]));

    mostChampions['champ$i']['champRate'] = (
        mostChampInfo.getElementsByClassName('played')[i].querySelectorAll('div')[1].innerHtml.split(ANO)[0]);

    mostChampions['champ$i']['champGrade'] = (
        mostChampInfo.getElementsByClassName('detail')[i].innerHtml.split('/'));
  }

  //rankInfo crawling
  if (rankInfo.getElementsByClassName('tier').isNotEmpty){
    tier =(
        rankInfo.getElementsByClassName('tier')[0].innerHtml.replaceAll(ANO, '')
    );
  }

  if (rankInfo.getElementsByClassName('lp').isNotEmpty){
    lp = (
        int.parse(rankInfo.getElementsByClassName('lp')[0].innerHtml.split(ANO)[0])
    );
  }

  if (rankInfo.getElementsByClassName('win-lose').isNotEmpty){
    win = (
        int.parse(rankInfo.getElementsByClassName('win-lose')[0].innerHtml.split(ANO)[0].replaceAll(RegExp(r'[^0-9]'), ''))
    );
    loss = (
        int.parse(rankInfo.getElementsByClassName('win-lose')[0].innerHtml.split(ANO).last.replaceAll(RegExp(r'[^0-9]'), ''))
    );
  }



  if (rankInfo.getElementsByClassName('ratio').isNotEmpty){
    rate = (
        int.parse(rankInfo.getElementsByClassName('ratio')[0].innerHtml.split(ANO)[2])
    );
  }

  //userInfo crawling
  if (opggData.getElementsByClassName('profile-icon').isNotEmpty){
    userIcon = (
        opggData.getElementsByClassName('profile-icon')[0].getElementsByTagName('img')[0].attributes['src']
    )!;
  }

  if (opggData.getElementsByClassName('level').isNotEmpty){
    userLevel = (
        int.parse(opggData.getElementsByClassName('level')[0].innerHtml)
    );
  }

  CardData data = CardData(
      userName : userName,
      userIcon : userIcon,
      lane : lane,
      userLevel : userLevel,
      tier : tier,
      rate : rate,
      win : win,
      loss : loss,
      lp : lp,
      mostChampions : mostChampions
  );
  data.printInfo();
  return data;
  }


