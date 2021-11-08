import 'package:hive/hive.dart';

part 'Substance.g.dart';

@HiveType(typeId: 3)
class Substance extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? doseTaken;
  @HiveField(2)
  String? doseGrade;
  @HiveField(3)
  String? timestamp;
}
