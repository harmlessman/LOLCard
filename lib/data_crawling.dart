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
  dataCrawling('DK ShowMaker');

}

dynamic dataCrawling(String userName, {String server='kr'}) async{
  var url  = Uri.parse('https://www.op.gg/summoners/${server}/${userName}');

  var re = await http.get(url);

  var opggData = parse(re.body);

  print('response.statusCode = ${re.statusCode}');

  // op.gg server error
  if (re.statusCode/100 !=2) {
    return 0;
  }

  // an unregistered summoner
  CardData data = CardData();
  if (opggData.getElementsByClassName('profile-icon').isEmpty){
    return 1;
  }

  var rankInfo = opggData.getElementsByClassName('css-1v663t e1x14w4w1')[0];
  var mostChampInfo = opggData.getElementsByClassName('css-e9xk5o e1g7spwk3')[0];
  //var userInfo = opggData.getElementsByClassName('css-1d2nav3 eioz3425')[0];

  int mostChampIen = mostChampInfo.querySelectorAll('img').length;

  if (mostChampIen>3){
    mostChampIen=3;
  }

  //mostChampInfo crawling
  for (int i=0; i<mostChampIen; i++){
    data.mostChampions['champ$i']['champ${i}Icon'] = (
        mostChampInfo.querySelectorAll('img')[i].attributes['src']);
    print(data.mostChampions['champ$i']['champ${i}Icon']);

    data.mostChampions['champ$i']['champ${i}Name'] = (
        mostChampInfo.getElementsByClassName('name')[i].getElementsByTagName('a')[0].innerHtml);
    print(data.mostChampions['champ$i']['champ${i}Name']);

    data.mostChampions['champ$i']['champ${i}Play'] = (
        int.parse(mostChampInfo.getElementsByClassName('count')[i].innerHtml.split(ANO)[0]));
    print(data.mostChampions['champ$i']['champ${i}Play']);

    data.mostChampions['champ$i']['champ${i}Rate'] = (
        mostChampInfo.getElementsByClassName('played')[i].querySelectorAll('div')[1].innerHtml.split(ANO)[0]);
    print(data.mostChampions['champ$i']['champ${i}Rate']);

    data.mostChampions['champ$i']['champ${i}Grade'] = (
        mostChampInfo.getElementsByClassName('detail')[i].innerHtml.split('/'));
    print(data.mostChampions['champ$i']['champ${i}Grade']);

  }

  //rankInfo crawling
  if (rankInfo.getElementsByClassName('tier').isNotEmpty){
    data.tier =(
        rankInfo.getElementsByClassName('tier')[0].innerHtml.replaceAll(ANO, '')
    );
    print(data.tier);
  }

  if (rankInfo.getElementsByClassName('lp').isNotEmpty){
    data.lp = (
        int.parse(rankInfo.getElementsByClassName('lp')[0].innerHtml.split(ANO)[0])
    );
    print(data.lp);
  }

  if (rankInfo.getElementsByClassName('win-lose').isNotEmpty){
    data.win = (
        int.parse(rankInfo.getElementsByClassName('win-lose')[0].innerHtml.split(ANO)[0].replaceAll(RegExp(r'[^0-9]'), ''))
    );
    print(data.win);

    data.loss = (
        int.parse(rankInfo.getElementsByClassName('win-lose')[0].innerHtml.split(ANO).last.replaceAll(RegExp(r'[^0-9]'), ''))
    );
    print(data.loss);
  }



  if (rankInfo.getElementsByClassName('ratio').isNotEmpty){
    data.rate = (
        int.parse(rankInfo.getElementsByClassName('ratio')[0].innerHtml.split(ANO)[2])
    );
    print(data.rate);
  }

  //userInfo crawling
  if (opggData.getElementsByClassName('profile-icon').isNotEmpty){
    data.userIcon = (
        opggData.getElementsByClassName('profile-icon')[0].getElementsByTagName('img')[0].attributes['src']
    );
    print(data.userIcon);
  }

  if (opggData.getElementsByClassName('level').isNotEmpty){
    data.userLevel = (
        int.parse(opggData.getElementsByClassName('level')[0].innerHtml)
    );
    print(data.userLevel);
  }

    return data;
  }


