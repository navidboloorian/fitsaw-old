// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Exercise extends _Exercise
    with RealmEntity, RealmObjectBase, RealmObject {
  Exercise(
    ObjectId id,
    String name,
    bool isTimed,
    bool isWeighted, {
    String? description,
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'isTimed', isTimed);
    RealmObjectBase.set(this, 'isWeighted', isWeighted);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
  }

  Exercise._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  bool get isTimed => RealmObjectBase.get<bool>(this, 'isTimed') as bool;
  @override
  set isTimed(bool value) => RealmObjectBase.set(this, 'isTimed', value);

  @override
  bool get isWeighted => RealmObjectBase.get<bool>(this, 'isWeighted') as bool;
  @override
  set isWeighted(bool value) => RealmObjectBase.set(this, 'isWeighted', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  Stream<RealmObjectChanges<Exercise>> get changes =>
      RealmObjectBase.getChanges<Exercise>(this);

  @override
  Exercise freeze() => RealmObjectBase.freezeObject<Exercise>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Exercise._);
    return const SchemaObject(ObjectType.realmObject, Exercise, 'Exercise', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('isTimed', RealmPropertyType.bool),
      SchemaProperty('isWeighted', RealmPropertyType.bool),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
    ]);
  }
}
