import 'package:realm/realm.dart';

part 'models.g.dart';

@RealmModel()
class _Exercise {
  @PrimaryKey()
  late ObjectId id;

  late String name;
  late bool isTimed;
  late bool isWeighted;
  late List<String> tags;
  late String? description;
}
