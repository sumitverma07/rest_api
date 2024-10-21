import 'package:flutter/material.dart';
import 'package:rest_api/api.dart';
import 'package:rest_api/model/album.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late Future<Album> albumvalue;
  @override
  void initState() {
    super.initState;
    albumvalue = fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Callings'),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<Album>(
                  future: albumvalue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final album = snapshot.data!;

                      return Column(
                        children: [
                          Text('UserId: ${album.userId}'),
                          Text('Id:${album.id}'),
                          Text('Title: ${album.title}'),
                        ],
                      );
                    } else {
                      return Text("unale to fetch data");
                    }
                  })
            ],
          ),
        ));
  }
}
