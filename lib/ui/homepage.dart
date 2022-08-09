import 'package:flutter/material.dart';
import 'package:structure/models/model.dart';
import 'package:structure/services/todoservices.dart';
import '../utlis/utlis.dart';
import '../widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
late Future<HelperModel> todoService;
class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoService = ToDoServices().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: babypink,
      appBar: AppBar(
        backgroundColor:hotpink,
        title: Center(
          child: Text(
            'News World',
            style: ktextstyle,
          ),
        ),
      ),
      body: FutureBuilder(
          future: todoService,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                  itemBuilder: (context, index) {
                    return buildContainer(snapshot, index,context);
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
            return Center(child: const CircularProgressIndicator(color: Colors.white,));
          }),
    );
  }
}
