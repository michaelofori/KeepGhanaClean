import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LeagueTable extends StatefulWidget {
  const LeagueTable({super.key});

  @override
  State<LeagueTable> createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          title: const Text("League Table"),
          backgroundColor: Color.fromARGB(255, 46, 90, 184),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingsPage()),
                // );
              },
            )
          ],
        ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: Colors.red,
            padding: EdgeInsets.all(20 ),
            child: Center(child: Text("Ranked by distance", style: Theme.of(context).textTheme.titleLarge,))
          ),

          FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.done){
                return Expanded(
            child: ListView.builder(
              itemCount: 20,//list size plus 1
              itemBuilder: (context, index) => index == 19 ?
              Container(
                padding: EdgeInsets.all(12),
                child: Center(child: Text("That's all folks", style: Theme.of(context).textTheme.titleMedium)),)
              :ListTile(
              
              leading: Icon(Icons.account_balance),
              title: Text("Person name $index"),
              trailing: Text("290 Walked"),
            )),
          );
              }
              return const CircularProgressIndicator();
            },
          )
          
        ],
      ),);
  }
}