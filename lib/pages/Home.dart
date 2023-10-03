import 'package:appquiz/data.dart';
import 'package:appquiz/pages/connect.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> course = datapb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemCount: course.length,
              itemBuilder: (context, index) =>
                  CourseCard(course: course[index]),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createitem,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  dynamic random() {
    var tem = randomCourse();
    print(tem);
    return tem;
  }

  Future<void> createitem() async {
    var tem = random();
    final pb = PocketBase('http://127.0.0.1:8090');
    final body = <String, dynamic>{
      "courseid": tem[0],
      "name": tem[1],
      "teacher": tem[2]
    };

    await pb.collection('data').create(body: body);
    setState(() {
      course.add(tem);
    });
    print(course);
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, this.course});
  final course;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(course[0].toString()),
        Text(course[1]),
        Text(course[2]),
      ],
    ));
  }
}
