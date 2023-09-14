import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sys/componant/custom_container.dart';
import 'package:sys/network/api/login/login_model.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:sys/network/api/apiManger.dart';
import 'package:sys/network/api/check_in/check_in_request.dart';
import 'package:sys/network/api/check_in/check_in_response.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";

  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  HomePage({
    this.emailController,
    this.passwordController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StopWatchTimer _stopwatchTimer = StopWatchTimer();
  final isHours = true;
  String? checkinTime;
  String? checkOutTime;

  @override
  void dispose() {
    super.dispose();
    _stopwatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e1dc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 40,
                ),
                // style: TextStyle(
                //   color: Colors.black,
                //   fontSize: 40,
                // ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                size: 80,
                                color: Color(0xff3f8e7d),
                              ),
                              Text(
                                "ODOO HR",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xfff9bb51),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<int>(
                              stream: _stopwatchTimer.rawTime,
                              initialData: _stopwatchTimer.rawTime.value,
                              builder: (context, snapshot) {
                                final value = snapshot.data;
                                final displayTime =
                                    StopWatchTimer.getDisplayTime(value!,
                                        hours: isHours);
                                return Text(displayTime,
                                    style: const TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold));
                              })
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xff3ebaaa),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                    child: Text(
                                  "check in ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                              ),
                              onTap: () {
                                setState(() {
                                  CheckIn();

                                  // _stopwatchTimer.onStartTimer();
                                  // checkinTime = DateTime.now()
                                  //     .toString()
                                  //     .substring(10, 19);
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                    child: Text(
                                  "check out",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                              ),
                              onTap: () {
                                setState(() {
                                  _stopwatchTimer.onStopTimer();
                                  checkOutTime = DateTime.now()
                                      .toString()
                                      .substring(10, 19);
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.cyan,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Check In   : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              "${checkinTime ?? "00:00:00"}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Check out : ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              "${checkOutTime ?? "00:00:00"}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void CheckIn() async {
    String email = widget.emailController!.text;
    String password = widget.passwordController!.text;
    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Check in Failed'),
          content: Text('Please enter both email and password.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
      return;
    }
    var response = await Api.login(email, password);
    String? access_token = response.accessToken;
    String? id = response.uid.toString(); // تحويل id إلى نص

    // استخدام نموذج استجابة جديد
    try {
      var checkInResponse = await Api.checkin(access_token, id);
      print('Response: ${response}');
      if (checkInResponse.proje_id != null) {
        setState(() {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Check in Failed'),
              content: Text(checkInResponse.message??'An error occurred.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          );
        });
      } else {
        setState(() {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('successfully'),
              content: Text("check in created successfully"),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          );
          print(checkInResponse.message);
          _stopwatchTimer.onStartTimer();
          checkinTime = DateTime.now().toString().substring(10, 19);
        });
      }
    } catch (error) {
      print(error);
      setState(() {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Check internet'),
            content: Text("${error.toString()}"),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      });
    }
  }
}
