import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'carddata.dart';
import 'dart:io';

class CardFrame extends StatefulWidget {
  const CardFrame({
    Key? key,
    required this.cardData,
    required this.thema,
      }) : super(key: key);

  final CardData cardData;
  final dynamic thema;

  @override
  State<CardFrame> createState() => _CardFrameState();
}

class _CardFrameState extends State<CardFrame> {

  @override
  Widget build(BuildContext context) {
    return Container(
          width: (MediaQuery.of(context).size.width)*0.9,
          height: (MediaQuery.of(context).size.width)*0.9*1.8,
          decoration: (widget.thema is XFile) ?
          BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: FileImage((
                  File(widget.thema.path))),
              fit: BoxFit.fill,
            ),
          ) :
          BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.thema
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width*0.35),
                height: (MediaQuery.of(context).size.width*0.35),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.cardData.userIcon!,
                    fit: BoxFit.fill,
                  ),
                )
              ),

              Text(
                'LV.${widget.cardData.userLevel}',
                style: TextStyle(
                  fontFamily: 'normal',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                widget.cardData.userName!,
                style: TextStyle(
                  fontFamily: 'normal',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),


              Card(
                margin: EdgeInsets.symmetric(horizontal: 75),
                color: Colors.white,
                child: ListTile(
                  leading: FlutterLogo(size: 75,),
                  title: Text(
                    '${widget.cardData.tier} ${widget.cardData.lp}LP',
                    textAlign:TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'normal',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  subtitle: Text(
                    textAlign:TextAlign.center,
                    '${widget.cardData.rate}% (${widget.cardData.win}Win / ${widget.cardData.loss}Loss)',
                    style: TextStyle(
                      fontFamily: 'normal',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),

              SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.white, thickness:2),
              ),

              Card(
                  margin: EdgeInsets.symmetric(horizontal: 75),
                  color: Colors.white,
                  child: ListTile(
                    leading: ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Image.network(
    widget.cardData.mostChampions!['champ0']['champIcon'],
    fit: BoxFit.fill,
    ),
    ),
                    title: Text(
                      "${widget.cardData.mostChampions!['champ0']['champName']}  ${widget.cardData.mostChampions!['champ0']['champPlay']}play  ${widget.cardData.mostChampions!['champ0']['champRate']}%",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    subtitle: Text(
                      textAlign:TextAlign.center,
                      '${widget.cardData.mostChampions!['champ0']['champGrade']}',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),

              Card(
                  margin: EdgeInsets.symmetric(horizontal: 75),
                  color: Colors.white,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        widget.cardData.mostChampions!['champ1']['champIcon'],
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      "${widget.cardData.mostChampions!['champ1']['champName']}  ${widget.cardData.mostChampions!['champ1']['champPlay']}play  ${widget.cardData.mostChampions!['champ1']['champRate']}%",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    subtitle: Text(
                      textAlign:TextAlign.center,
                      '${widget.cardData.mostChampions!['champ1']['champGrade']}',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),

              Card(
                  margin: EdgeInsets.symmetric(horizontal: 75),
                  color: Colors.white,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        widget.cardData.mostChampions!['champ2']['champIcon'],
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      "${widget.cardData.mostChampions!['champ2']['champName']}  ${widget.cardData.mostChampions!['champ2']['champPlay']}play  ${widget.cardData.mostChampions!['champ2']['champRate']}%",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    subtitle: Text(
                      textAlign:TextAlign.center,
                      '${widget.cardData.mostChampions!['champ2']['champGrade']}',
                      style: TextStyle(
                        fontFamily: 'normal',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),






            ],
          ),

    );
  }
}
