import 'package:hive/hive.dart';

part 'ContactMethod.g.dart';

@HiveType(typeId: 1)
enum ContactMethod {
  @HiveField(0)
  phone_call,
  @HiveField(1)
  phone_sms,
  @HiveField(2)
  email,
}
