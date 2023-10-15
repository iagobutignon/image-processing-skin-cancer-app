import 'package:uuid/uuid.dart';

class Guid {
  static String get newGuid => const Uuid().v4();
}