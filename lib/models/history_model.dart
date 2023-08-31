import 'package:hive/hive.dart';
part 'history_model.g.dart';

// this will generate models
// then use this command in terminal => flutter packages pub run build_runner build
// above command will automatically generate adapter of the new model
// flutter_hive provides listenable to show in real time

@HiveType(typeId: 0)
class HistoryModel extends HiveObject {
  @HiveField(0)
  final String? text;
  @HiveField(1)
  final String? dateTime;
  @HiveField(2)
  final String? type;

  HistoryModel({this.text, this.dateTime, this.type});

  Map<String, dynamic> toJson() => {
        "text": text,
        "dateTime": dateTime,
        "type": type,
      };
}
