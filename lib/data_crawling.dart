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
  dataCrawling('');

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
  var t = opggData.querySelectorAll('.champion-box/face')[0];

  print('t = ${t.innerHtml}');
  print(t.attributeValueSpans);
  /*
  print('rankInfo = ${rankInfo.innerHtml} \n\n');
  print('mostChampInfo = ${mostChampInfo.innerHtml} \n\n');
  print('userInfo = ${userInfo.innerHtml} \n\n');

*/
  var impath = rankInfo.getElementsByTagName('img')[0];
  //print(impath.outerHtml);

  return data;
}

