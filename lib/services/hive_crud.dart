import 'package:hive/hive.dart';

class HiveCrud {

  static Box? ref = Hive.box("myBox");  

  static void create(String key, dynamic value) {
    ref?.put(key, value);
  }

  static dynamic read(String key) {
    return ref?.get(key);
  }

  static void remove(String key) {
    ref?.delete(key);
  }
}
