import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sys/componant/custom_container.dart';

class HomePage extends StatelessWidget {
  static const routeName = "HomePage";

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
              SizedBox(
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
                          CustomContainer(
                            text: "10",
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 30),
                          ),
                          CustomContainer(
                            text: "00",
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 30),
                          ),
                          CustomContainer(
                            text: "00",
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 30),
                          ),
                          CustomContainer(
                            text: "00",
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
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
                            const Column(
                              children: [
                                Text(
                                  "Check In",
                                  style: TextStyle(
                                    color: Color(0xff95cb96),
                                  ),
                                ),
                                Text("00:00:00"),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Check out",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                Text("00:00:00"),
                              ],
                            ),
                          ],
                        ),
                      )
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
}
