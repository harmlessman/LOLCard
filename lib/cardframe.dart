import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'carddata.dart';
import 'dart:io';

class CardFrame extends StatefulWidget {
  const CardFrame({
    Key? key,
    required this.cardData,
    required this.background,
    required this.colorData,
  }) : super(key: key);

  final CardData cardData;
  final dynamic background;
  final Map colorData;


  @override
  State<CardFrame> createState() => _CardFrameState();
}

class _CardFrameState extends State<CardFrame> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: (width * 0.9),
      height: (width * 0.9 * 1.8),
      decoration: (widget.background is XFile)
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: FileImage((File(widget.background.path))),
                fit: BoxFit.fill,
              ),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.background),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: (width * 0.35),
              height: (width * 0.35),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.cardData.userIcon!,
                  fit: BoxFit.fill,
                ),
              )),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              widget.cardData.userName!,
              style: TextStyle(
                  fontFamily: 'normal',
                  fontSize: width*0.1,
                  fontWeight: FontWeight.bold,
                  color: widget.colorData['textColor']),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'LV.${widget.cardData.userLevel}\n${widget.cardData.lane!} laner',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'normal',
                  fontSize: width*0.04,
                  fontWeight: FontWeight.bold,
                  color: widget.colorData['textColor']),
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(horizontal: width*0.1),
              color: widget.colorData['boxColor'],
              child: ListTile(
                  //visualDensity: VisualDensity(vertical: -3),
                  leading: FlutterLogo(
                    size: width*0.1,
                  ),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${widget.cardData.tier} ${widget.cardData.lp}LP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.04,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ),
                  subtitle: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      textAlign: TextAlign.center,
                      '${widget.cardData.rate}% (${widget.cardData.win}Win / ${widget.cardData.loss}Loss)',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.03,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ))),
          SizedBox(
            height: width*0.05,
            width: width*0.5,
            child: Divider(color: Colors.white, thickness: 2),
          ),
          Card(
              margin: EdgeInsets.symmetric(horizontal: width*0.1),
              color: widget.colorData['boxColor'],
              child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.cardData.mostChampions!['champ0']['champIcon'],
                      fit: BoxFit.fill,
                      width: width*0.1,
                      height: width*0.1,
                    ),
                  ),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${widget.cardData.mostChampions!['champ0']['champName']}  ${widget.cardData.mostChampions!['champ0']['champPlay']}play  ${widget.cardData.mostChampions!['champ0']['champRate']}%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.04,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ),
                  subtitle: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      textAlign: TextAlign.center,
                      '${widget.cardData.mostChampions!['champ0']['champGrade']}',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.03,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ))),
          Card(
              margin: EdgeInsets.symmetric(horizontal: width*0.1),
              color: widget.colorData['boxColor'],
              child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.cardData.mostChampions!['champ1']['champIcon'],
                      fit: BoxFit.fill,
                      width: width*0.1,
                      height: width*0.1,
                    ),
                  ),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${widget.cardData.mostChampions!['champ1']['champName']}  ${widget.cardData.mostChampions!['champ1']['champPlay']}play  ${widget.cardData.mostChampions!['champ1']['champRate']}%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.04,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ),
                  subtitle: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      textAlign: TextAlign.center,
                      '${widget.cardData.mostChampions!['champ1']['champGrade']}',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.03,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ))),
          Card(
              margin: EdgeInsets.symmetric(horizontal: width*0.1),
              color: widget.colorData['boxColor'],
              child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.cardData.mostChampions!['champ2']['champIcon'],
                      fit: BoxFit.fill,
                      width: width*0.1,
                      height: width*0.1,
                    ),
                  ),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${widget.cardData.mostChampions!['champ2']['champName']}  ${widget.cardData.mostChampions!['champ2']['champPlay']}play  ${widget.cardData.mostChampions!['champ2']['champRate']}%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.04,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ),
                  subtitle: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      textAlign: TextAlign.center,
                      '${widget.cardData.mostChampions!['champ2']['champGrade']}',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: width*0.03,
                        fontWeight: FontWeight.bold,
                        color: widget.colorData['boxTextColor'],
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
