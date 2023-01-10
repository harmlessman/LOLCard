import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  String version = '1.0.1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppInfo'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.sticky_note_2_outlined),
            title: Text("Licenses"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LicensePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2),
            title: Text("Riot Policies"),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: Column(
                      children: [Text("Riot Policies")],
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '[LOLCard] was created under Riot Games "Legal Jibber Jabber" policy using assets owned by Riot Games.Riot Games does not endorse or sponsor this project.\n'),
                          Text(
                              "[LOLCard] isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone officially involved in producing or managing Riot Games properties. Riot Games, and all associated properties are trademarks or registered trademarks of Riot Games, Inc.\n"),
                          Text(
                              'The League of Legends position icon, rank icon is taken from the link below.'),
                          Text('https://developer.riotgames.com/docs/lol\n'),
                          Text(
                              'Summoner records, rank information, etc. are obtained from OP.GG.'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: Column(
                      children: [Text("We welcome your feedback!")],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email : harmlessman17@gmail.com'),
                        Text('github : https://github.com/harmlessman/LOLCard')
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.onetwothree),
            title: Text("Version"),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: Column(
                      children: [Text("LOLCard")],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Version : $version')],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
