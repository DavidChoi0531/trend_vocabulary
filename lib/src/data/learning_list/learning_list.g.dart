// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_list.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class LearningListData extends DataClass
    implements Insertable<LearningListData> {
  final int id;
  final String word;
  LearningListData({required this.id, required this.word});
  factory LearningListData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LearningListData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      word: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}word'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    return map;
  }

  LearningListCompanion toCompanion(bool nullToAbsent) {
    return LearningListCompanion(
      id: Value(id),
      word: Value(word),
    );
  }

  factory LearningListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningListData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
    };
  }

  LearningListData copyWith({int? id, String? word}) => LearningListData(
        id: id ?? this.id,
        word: word ?? this.word,
      );
  @override
  String toString() {
    return (StringBuffer('LearningListData(')
          ..write('id: $id, ')
          ..write('word: $word')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningListData &&
          other.id == this.id &&
          other.word == this.word);
}

class LearningListCompanion extends UpdateCompanion<LearningListData> {
  final Value<int> id;
  final Value<String> word;
  const LearningListCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
  });
  LearningListCompanion.insert({
    this.id = const Value.absent(),
    required String word,
  }) : word = Value(word);
  static Insertable<LearningListData> custom({
    Expression<int>? id,
    Expression<String>? word,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
    });
  }

  LearningListCompanion copyWith({Value<int>? id, Value<String>? word}) {
    return LearningListCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningListCompanion(')
          ..write('id: $id, ')
          ..write('word: $word')
          ..write(')'))
        .toString();
  }
}

class $LearningListTable extends LearningList
    with TableInfo<$LearningListTable, LearningListData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LearningListTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String?> word = GeneratedColumn<String?>(
      'word', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word];
  @override
  String get aliasedName => _alias ?? 'learning_list';
  @override
  String get actualTableName => 'learning_list';
  @override
  VerificationContext validateIntegrity(Insertable<LearningListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LearningListData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LearningListTable createAlias(String alias) {
    return $LearningListTable(_db, alias);
  }
}

abstract class _$LearningListDatabase extends GeneratedDatabase {
  _$LearningListDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $LearningListTable learningList = $LearningListTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [learningList];
}
