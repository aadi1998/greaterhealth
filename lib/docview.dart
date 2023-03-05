import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class docview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Doctor View"),
        ),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.white,
              ],
            )),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome Doctor",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                      leading: Text("Jane Doe"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("User Profile"),
                                    content: Text("Jane\nDoe\n00001\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("John Doe"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Aaditya Rajput"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Mamun Hossain"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Gobikah Balaruban"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Manreet Kaur"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Mikael Eklund"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Vijay Sood"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Lebron James"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Elon Musk"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                  ListTile(
                      leading: Text("Neymar"),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text("Name"),
                                    content: Text(
                                        "First Name\nLast Name\nPatient ID\n"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Close")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("View Details"))
                                    ]));
                      }),
                ])
              ]),
            )));
  }
}
