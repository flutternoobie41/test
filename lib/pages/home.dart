import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getJson(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if(snapshot.data==null){
            return Container(
              child: Text("loading"),
            );
          }else {
            return ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data![index].image),
                    ),
                    title: Text(snapshot.data[index].company),
                    subtitle: Text(snapshot.data[index].skillsRequired),
                  );
                });
            //return buildUsers(movies);
          }
        },
      ),
    );
  }



  Future<List<User>> getJson() async{
    Uri url = Uri.parse('https://retoolapi.dev/CIuwqM/jobs');
    var data= await http.get(url);
    var jsonDataList = json.decode(data.body) as List<dynamic>;
    List<User> items = jsonDataList.map((model) => User.fromJson(model)).toList();
    return items;

    /* List<User> items=[];
    for(var ma in jsonData){

      User m = User(ma["title"],ma["image"],ma["releaseyear"]);
      items.add(m);
    }

return items;*/
  }
}
class User {
  int? id;
  String? date;
  late String image;
  late String company;
  String? location;
  String? position;
  late String skillsRequired;

  User(
      {this.id,
        this.date,
        required this.image,
        required this.company,
        this.location,
        this.position,
        required this.skillsRequired});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    image = json['image'];
    company = json['company'];
    location = json['location'];
    position = json['position'];
    skillsRequired = json['skills_required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['image'] = this.image;
    data['company'] = this.company;
    data['location'] = this.location;
    data['position'] = this.position;
    data['skills_required'] = this.skillsRequired;
    return data;
  }
}

