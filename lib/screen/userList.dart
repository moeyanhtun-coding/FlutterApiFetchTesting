import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_fetch/utils/userCard.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../model/userModel.dart';

class Userlist extends StatefulWidget {
  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  List<User> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserLists();
  }

  Future<void> getUserLists() async {
    setState(() {
      isLoading = true;
    });

    final response =
        await http.get(Uri.parse("http://192.168.1.30:3000/api/users"));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print('User data is - $jsonData');

      setState(() {
        users = jsonData.map((data) => User.fromJson(data)).toList();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _headerText(),
      ),
      body: isLoading ? _loading() : _userList(context),
    );
  }

  Widget _userList(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Usercard(user: users[index]);
      },
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Users List",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }

  Widget _loadingMessage() {
    return const Text(
      "Loading",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
    );
  }

  Widget _loading() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loadingMessage(),
        LoadingAnimationWidget.horizontalRotatingDots(
          color: const Color.fromARGB(255, 0, 0, 0),
          size: 60,
        ),
      ],
    ));
  }
}
