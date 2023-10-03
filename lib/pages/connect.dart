import 'package:pocketbase/pocketbase.dart';

List<dynamic> datapb = [];

Future<List<RecordModel>> loaddata() async {
  final pb = PocketBase('http://127.0.0.1:8090');
  final records = await pb.collection('data').getFullList(
        sort: '-created',
      );
  return records;
}

Future<void> load() async {
  var records = await loaddata();
  datapb.clear();
  for (var item in records) {
    List temp = [];
    temp.add(item.data['courseid']);
    temp.add(item.data['name']);
    temp.add(item.data['teacher']);
    datapb.add(temp);
  }
  print(datapb);
}
