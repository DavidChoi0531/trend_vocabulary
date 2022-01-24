import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path_provider/path_provider.dart';

part 'init_db.g.dart';

class InitDB extends Table {
  IntColumn get initNumber => integer().autoIncrement()();
  TextColumn get todaysWord => text()();
  DateTimeColumn get today => dateTime()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'init_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [InitDB])
class InitDBDatabase extends _$InitDBDatabase {
  InitDBDatabase() : super(_openConnection());

  Future<InitDBData> get allInitEntries => select(initDB).getSingle();

  Future addInit(InitDBCompanion data) {
    return into(initDB).insert(data);
  }

  Future updateInit(InitDBCompanion data) {
    return (update(initDB)..where((tbl) => tbl.initNumber.equals(1)))
        .write(data);
  }

  @override
  int get schemaVersion => 1;
}
