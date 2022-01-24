import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'learning_list.g.dart';

class LearningList extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'learning_list_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [LearningList])
class LearningListDatabase extends _$LearningListDatabase {
  LearningListDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<LearningListData>> get allLearningListEntries =>
      select(learningList).get();

  Future<int> addLearningList(LearningListCompanion entry) {
    return into(learningList).insert(entry);
  }

  deleteLearningList() => delete(learningList).go();
}
