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



  var rankInfo = opggData.getElementsByClassName('css-1v663t e1x14w4w1')[0];
  var mostChampInfo = opggData.getElementsByClassName('css-e9xk5o e1g7spwk3')[0];
  //var userInfo = opggData.getElementsByClassName('css-1d2nav3 eioz3425')[0];

  int mostChampIen = mostChampInfo.querySelectorAll('img').length;

  if (mostChampIen>3){
    mostChampIen=3;
  }

  //mostChampInfo crawling
  for (int i=0; i<mostChampIen; i++){
    mostChampions['champ$i']['champ${i}Icon'] = (
        mostChampInfo.querySelectorAll('img')[i].attributes['src']);
    print(mostChampions['champ$i']['champ${i}Icon']);

    mostChampions['champ$i']['champ${i}Name'] = (
        mostChampInfo.getElementsByClassName('name')[i].getElementsByTagName('a')[0].innerHtml);
    print(mostChampions['champ$i']['champ${i}Name']);

    mostChampions['champ$i']['champ${i}Play'] = (
        int.parse(mostChampInfo.getElementsByClassName('count')[i].innerHtml.split(ANO)[0]));
    print(mostChampions['champ$i']['champ${i}Play']);

    mostChampions['champ$i']['champ${i}Rate'] = (
        mostChampInfo.getElementsByClassName('played')[i].querySelectorAll('div')[1].innerHtml.split(ANO)[0]);
    print(mostChampions['champ$i']['champ${i}Rate']);

    mostChampions['champ$i']['champ${i}Grade'] = (
        mostChampInfo.getElementsByClassName('detail')[i].innerHtml.split('/'));
    print(mostChampions['champ$i']['champ${i}Grade']);

  }

  //rankInfo crawling
  if (rankInfo.getElementsByClassName('tier').isNotEmpty){
    tier =(
        rankInfo.getElementsByClassName('tier')[0].innerHtml.replaceAll(ANO, '')
    );
    print(tier);
  }

  if (rankInfo.getElementsByClassName('lp').isNotEmpty){
    lp = (
        int.parse(rankInfo.getElementsByClassName('lp')[0].innerHtml.split(ANO)[0])
    );
    print(lp);
  }

  if (rankInfo.getElementsByClassName('win-lose').isNotEmpty){
    win = (
        int.parse(rankInfo.getElementsByClassName('win-lose')[0].innerHtml.split(ANO)[0].replaceAll(RegExp(r'[^0-9]'), ''))
    );
    print(win);

    loss = (
        int.parse(rankInfo.getElementsByClassName('win-lose')[0].innerHtml.split(ANO).last.replaceAll(RegExp(r'[^0-9]'), ''))
    );
    print(loss);
  }



  if (rankInfo.getElementsByClassName('ratio').isNotEmpty){
    rate = (
        int.parse(rankInfo.getElementsByClassName('ratio')[0].innerHtml.split(ANO)[2])
    );
    print(rate);
  }

  //userInfo crawling
  if (opggData.getElementsByClassName('profile-icon').isNotEmpty){
    userIcon = (
        opggData.getElementsByClassName('profile-icon')[0].getElementsByTagName('img')[0].attributes['src']
    )!;
    print(userIcon);
  }

  if (opggData.getElementsByClassName('level').isNotEmpty){
    userLevel = (
        int.parse(opggData.getElementsByClassName('level')[0].innerHtml)
    );
    print(userLevel);
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
    return data;
  }


