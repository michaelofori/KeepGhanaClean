import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';
import '../main.dart';

class timer extends StatefulWidget {
  const timer({super.key});

  @override
  State<timer> createState() => _activityWalkState();
}

class _activityWalkState extends State<timer> with TickerProviderStateMixin{


  int hour = 0;
  int min = 0;
  int sec = 0;
  String timetodisplay = "";
  // bool variables is defined to use to
  // enable/disable the Buttons when it pressed
  bool started = true;
  bool stopped = true;
  late int timefortimer;
  bool canceltimer = false;

  
  void start() {
    setState(() {
      started = false;
      stopped = false;
    });
    //TODO Convert Time in Seconds
    timefortimer = ((hour * 3600) + (min * 60) + sec);
    // we give a "timer" in place of "callback"
    // bcz we don't want to run timer continuously
    // so we need to stop timer running continuously
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timefortimer < 1 || canceltimer == true) {
          t.cancel();
          // if we want to reset the (time selector) timer
          // then write the following line of code
          
      Fluttertoast.showToast(msg: "Goal completed");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const MyStatefulWidget()));
        } else if (timefortimer < 60) {
          timetodisplay = timefortimer.toString();
          timefortimer = timefortimer - 1;
        } else if (timefortimer < 3600) {
          int m = timefortimer ~/ 60;
          int s = timefortimer - (60 * m);
          timetodisplay = "$m:$s";
          timefortimer = timefortimer - 1;
        } else {
          int h = timefortimer ~/ 3600;
          int x = timefortimer - (3600 * h);
          int m = x ~/ 60;
          int s = x - (60 * m);
          timetodisplay =
              "$h:$m:$s";
          timefortimer = timefortimer - 1;
        }
      });
    });
  }

 
  void stop()async {
    print("end");
     await Fluttertoast.showToast(msg: "timer end");
    setState(() {
      started = true;
      stopped = true;
      canceltimer = true;
      // if we want to empty time's text where the running time is displaying
      // then write the following line of code
      timetodisplay = "";
    });
  }

 
  late TabController tb;
  @override
  void initState() {
    tb = TabController(length: 2, vsync: this);
    super.initState();
    
  }


  Widget timer() {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'HH',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                  NumberPicker(
                    value: hour,
                    minValue: 0,
                    maxValue: 24,
                    itemWidth: 80.0,
                    textStyle: const TextStyle(fontFamily: 'Times New Roman'),
                    onChanged: (value) {
                      setState(() {
                        hour = value;
                      });
                    },
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'MM',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                  NumberPicker(
                    value: min,
                    minValue: 0,
                    maxValue: 24,
                    itemWidth: 80.0,
                    textStyle: const TextStyle(fontFamily: 'Times New Roman'),
                    onChanged: (value) {
                      setState(() {
                        min = value;
                      });
                    },
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'SS',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                  NumberPicker(
                    value: sec,
                    minValue: 0,
                    maxValue: 24,
                    itemWidth: 80.0,
                    textStyle: const TextStyle(fontFamily: 'Times New Roman'),
                    onChanged: (value) {
                      setState(() {
                        sec = value;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            timetodisplay,
            style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: started ? start : null,
                style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
                ),child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: stopped ? null : stop,
                style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
                ),
                child: const Text(
                  'Stop',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
  // bool variables is defined to use to
  // enable/disable the Buttons when it pressed
  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = true;
  String stoptimetodisplay = "00:00:00";
  var swatch = Stopwatch();

  void starttimer() {
    Timer(const Duration(seconds: 1), keeprunning);
  }

  // "Keep Running" is the callback function of timer
  void keeprunning() {
    if (swatch.isRunning) {
      starttimer();
    }
    setState(() {
      stoptimetodisplay = "${swatch.elapsed.inHours.toString().padLeft(2, "0")}:${(swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}:${(swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
    });
  }

 
  void startstopwatch() {
    setState(() {
      startispressed = false;
      stopispressed = false;
    });
    swatch.start();
    starttimer();
  }

  void stopstopwatch() {
    setState(() {
      stopispressed = true;
      resetispressed = false;
    });
    swatch.stop();
  }

  void resetstopwatch() {
    setState(() {
      resetispressed = true;
      startispressed = true;
    });
    swatch.reset();
    stoptimetodisplay = "00:00:00";
  }

 
  Widget stopwatch() {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              stoptimetodisplay,
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Times New Roman',
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: stopispressed ? null : stopstopwatch,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 35.0),
                    ),
                    child: const Text(
                      'Stop',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: resetispressed ? null : resetstopwatch,
                    style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 35.0),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: startispressed ? startstopwatch : null,
                 style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
                 ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SET  YOUR   GOAL',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: "Signatra",
              fontSize: 30.0,
          ),
        ),
      
        bottom: TabBar(
          tabs: const [
            Text('Timer'),
            // Text('Stopwatch'),
          ],
          controller: tb,
          labelStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Times New Roman',
          ),
          labelPadding: const EdgeInsets.only(bottom: 10.0),
          unselectedLabelColor: Colors.white60,
        ),
      ),
      
      body: TabBarView(
        controller: tb,
        children: [
          // stop Timer Function
          timer(),
          //Stopwatch Function
          stopwatch(),
        ],
      ),
    );
  }
}
