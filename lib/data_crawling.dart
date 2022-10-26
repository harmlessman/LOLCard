import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:html/parser.dart';

import 'carddata.dart';


/*
css-1v663t e1x14w4w1 => 솔랭 티어, lp, 승, 패, 승률
css-e9xk5o e1g7spwk3 => 모스트 챔프
css-1d2nav3 eioz3425 => 유저 정보
 */
void main() async{
  dataCrawling('unhappier');

}

Future<CardData> dataCrawling(String userName, {String server='kr'}) async{
  var url  = Uri.parse('https://www.op.gg/summoners/${server}/${userName}');

  var re = await http.get(url);

  var opggData = parse(re.body);

  print('response.statusCode = ${re.statusCode}');

  CardData data = CardData();

  var rankInfo = opggData.getElementsByClassName('css-1v663t e1x14w4w1')[0];
  var mostChampInfo = opggData.getElementsByClassName('css-e9xk5o e1g7spwk3')[0];
  var userInfo = opggData.getElementsByClassName('css-1d2nav3 eioz3425')[0];

  //mostChampInfo crawling
  for (int i=0; i<3; i++){
    data.mostChampions['champ$i']['champ${i}Icon'] = mostChampInfo.querySelectorAll('img')[0].attributes['src'];
    print(data.mostChampions['champ$i']['champ${i}Icon']);

    data.mostChampions['champ$i']['champ${i}Name'] = mostChampInfo.getElementsByClassName('name')[0].getElementsByTagName('a')[0].innerHtml;
    print( data.mostChampions['champ$i']['champ${i}Name']);

    data.mostChampions['champ$i']['champ${i}Play'] = int.parse(mostChampInfo.getElementsByClassName('count')[0].innerHtml.split('<!-- -->')[0]);
    print(data.mostChampions['champ$i']['champ${i}Play']);

    data.mostChampions['champ$i']['champ${i}Rate'] = mostChampInfo.getElementsByClassName('played')[i].querySelectorAll('div')[1].innerHtml.split('<!-- -->')[0];
    print(data.mostChampions['champ$i']['champ${i}Rate']);

    data.mostChampions['champ$i']['champ${i}Grade'] = mostChampInfo.getElementsByClassName('detail')[i].innerHtml.split('/');
    print(data.mostChampions['champ$i']['champ${i}Grade']);

  }

  var t = opggData.querySelectorAll('.champion-box/face')[0];










  return data;
}

