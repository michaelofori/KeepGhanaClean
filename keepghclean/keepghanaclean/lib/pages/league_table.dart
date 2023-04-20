import 'package:flutter/material.dart';
import '../widgets/progress.dart';

class LeagueTable extends StatefulWidget {
  const LeagueTable({super.key});

  @override
  State<LeagueTable> createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 209, 218),
      appBar: AppBar(
        title: const Text(
          "League Table",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Signatra",
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Theme.of(context).accentColor,
   
      ),
      body: Column(
        children: [
          Container(
              width: double.maxFinite,
              color: Color.fromARGB(255, 60, 89, 218),
              padding: EdgeInsets.all(20),
              child: Center(
                  child: Text(
                "Ranked by distance",
                style: Theme.of(context).textTheme.titleLarge,
              ))),
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                    child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text('aliceli'),
                      trailing: Text("15.2 km"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text('janedoe'),
                      trailing: Text("12.6 km"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text('johndoe'),
                      trailing: Text("10.5 km"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text('aliceli'),
                      trailing: Text("9.8 km"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text('johndoe'),
                      trailing: Text("8.2 km"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text('bobsmith'),
                      trailing: Text("6.7 km"),
                    ),
                                      
                  ],
                )
                    // child: ListView.builder(
                    //   itemCount: 7, //list size plus 1
                    //   itemBuilder: (context, index) => index == 6
                    //       ? Container(
                    //           padding: EdgeInsets.all(12),
                    //           child: Center(
                    //             child: Text("That's all folks",
                    //                 style:
                    //                     Theme.of(context).textTheme.titleMedium),
                    //           ),
                    //         )
                    //       : const ListTile(
                    //           leading: Icon(Icons.flight),
                    //           title: Text('Flight'),
                    //           trailing: Icon(Icons.more_vert),
                    //           // leading: Icon(Icons.person_4_sharp),
                    //           // title: Text(" Username $index"),
                    //           // trailing: Text("290 Km tracked"),
                    //         ),
                    // ),
                    );
              }
              return circularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
