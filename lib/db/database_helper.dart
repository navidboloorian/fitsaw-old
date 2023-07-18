import 'package:realm/realm.dart';

class DatabaseHelper<T extends RealmObject> {
  final RealmResults<T> items;
  final Realm _realm;

  DatabaseHelper(this.items) : _realm = items.realm;

  void add(T item) {
    _realm.write(() => _realm.add(item));
  }

  void update(T item) {
    _realm.write(() => _realm.add(item, update: true));
  }

  void delete(T item) {
    _realm.write(() => _realm.delete(item));
  }

  void get(ObjectId id) {
    _realm.query<T>('id == $id');
  }
}
