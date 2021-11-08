import 'package:hive/hive.dart';

part 'Note.g.dart';

@HiveType(typeId: 4)
class Note extends HiveObject {
  @HiveField(0)
  String? timestamp;
  @HiveField(1)
  String? note;
}
