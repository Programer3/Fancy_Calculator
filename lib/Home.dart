// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Landing.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.5],
        colors: [
          Colors.orange.shade200,
          Colors.white,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.sunny)),
                    IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          if (FirebaseAuth.instance.currentUser == null) {
                            setState(() {
                              StreamBuilder<User?>(
                                stream:
                                    FirebaseAuth.instance.authStateChanges(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Landing();
                                  } else {
                                    return Home();
                                  }
                                },
                              );
                            });
                          }
                        });
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Hi,Olga",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Where today you will work!",
                      style: TextStyle(fontSize: 15),
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 24,
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "search",
                  ),
                )),
            Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "View All",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.info,
                        size: 12,
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                height: MediaQuery.of(context).size.height / 5,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Row(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://s3.us-east-1.amazonaws.com/co-assets/assets/images/_fbTw/coworking-vs-office.jpg"),
                                        fit: BoxFit.cover))),
                            Text(
                              "Co-Space",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 11,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://images.prismic.io/screencloud/79c677e2b27be1ae222c85e35dbd10dfd1ca2db7_the-7-types-of-people-you-find-around-office-meeting-rooms.jpg?auto=compress,format"),
                                      fit: BoxFit.cover))),
                          Center(
                            child: Text(
                              "Meeting Room",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://sc04.alicdn.com/kf/H4ade1b0146d74ea2b1a01bc99af9c7c4j.jpg"),
                                        fit: BoxFit.cover))),
                            Text(
                              "Office",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCGLz7E3zbdiR-lEAHj-R4CiGFgRJDyeYDCw&usqp=CAU"),
                                        fit: BoxFit.cover))),
                            Text(
                              "Campus",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREUAi2154mvfKv6NFQqZlP915Oulp0k37fdQ&usqp=CAU"),
                                        fit: BoxFit.cover))),
                            Text(
                              "Facility",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ])
                ])),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: MediaQuery.of(context).size.height / 3.42,
                    width: MediaQuery.of(context).size.width / 1.15,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 5,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.workdesign.com/wp-content/uploads/2020/08/Office-layout.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Neo 56 Space    ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              "4.7(98)",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "40 Photo , Cafe , Wifi",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        )),
      ),
    );
  }
}
