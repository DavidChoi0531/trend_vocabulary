// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class InitDBData extends DataClass implements Insertable<InitDBData> {
  final int initNumber;
  final String todaysWord;
  final DateTime today;
  InitDBData(
      {required this.initNumber,
      required this.todaysWord,
      required this.today});
  factory InitDBData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InitDBData(
      initNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}init_number'])!,
      todaysWord: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}todays_word'])!,
      today: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}today'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['init_number'] = Variable<int>(initNumber);
    map['todays_word'] = Variable<String>(todaysWord);
    map['today'] = Variable<DateTime>(today);
    return map;
  }

  InitDBCompanion toCompanion(bool nullToAbsent) {
    return InitDBCompanion(
      initNumber: Value(initNumber),
      todaysWord: Value(todaysWord),
      today: Value(today),
    );
  }

  factory InitDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InitDBData(
      initNumber: serializer.fromJson<int>(json['initNumber']),
      todaysWord: serializer.fromJson<String>(json['todaysWord']),
      today: serializer.fromJson<DateTime>(json['today']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'initNumber': serializer.toJson<int>(initNumber),
      'todaysWord': serializer.toJson<String>(todaysWord),
      'today': serializer.toJson<DateTime>(today),
    };
  }

  InitDBData copyWith({int? initNumber, String? todaysWord, DateTime? today}) =>
      InitDBData(
        initNumber: initNumber ?? this.initNumber,
        todaysWord: todaysWord ?? this.todaysWord,
        today: today ?? this.today,
      );
  @override
  String toString() {
    return (StringBuffer('InitDBData(')
          ..write('initNumber: $initNumber, ')
          ..write('todaysWord: $todaysWord, ')
          ..write('today: $today')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(initNumber, todaysWord, today);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InitDBData &&
          other.initNumber == this.initNumber &&
          other.todaysWord == this.todaysWord &&
          other.today == this.today);
}

class InitDBCompanion extends UpdateCompanion<InitDBData> {
  final Value<int> initNumber;
  final Value<String> todaysWord;
  final Value<DateTime> today;
  const InitDBCompanion({
    this.initNumber = const Value.absent(),
    this.todaysWord = const Value.absent(),
    this.today = const Value.absent(),
  });
  InitDBCompanion.insert({
    this.initNumber = const Value.absent(),
    required String todaysWord,
    required DateTime today,
  })  : todaysWord = Value(todaysWord),
        today = Value(today);
  static Insertable<InitDBData> custom({
    Expression<int>? initNumber,
    Expression<String>? todaysWord,
    Expression<DateTime>? today,
  }) {
    return RawValuesInsertable({
      if (initNumber != null) 'init_number': initNumber,
      if (todaysWord != null) 'todays_word': todaysWord,
      if (today != null) 'today': today,
    });
  }

  InitDBCompanion copyWith(
      {Value<int>? initNumber,
      Value<String>? todaysWord,
      Value<DateTime>? today}) {
    return InitDBCompanion(
      initNumber: initNumber ?? this.initNumber,
      todaysWord: todaysWord ?? this.todaysWord,
      today: today ?? this.today,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (initNumber.present) {
      map['init_number'] = Variable<int>(initNumber.value);
    }
    if (todaysWord.present) {
      map['todays_word'] = Variable<String>(todaysWord.value);
    }
    if (today.present) {
      map['today'] = Variable<DateTime>(today.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InitDBCompanion(')
          ..write('initNumber: $initNumber, ')
          ..write('todaysWord: $todaysWord, ')
          ..write('today: $today')
          ..write(')'))
        .toString();
  }
}

class $InitDBTable extends InitDB with TableInfo<$InitDBTable, InitDBData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $InitDBTable(this._db, [this._alias]);
  final VerificationMeta _initNumberMeta = const VerificationMeta('initNumber');
  @override
  late final GeneratedColumn<int?> initNumber = GeneratedColumn<int?>(
      'init_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _todaysWordMeta = const VerificationMeta('todaysWord');
  @override
  late final GeneratedColumn<String?> todaysWord = GeneratedColumn<String?>(
      'todays_word', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _todayMeta = const VerificationMeta('today');
  @override
  late final GeneratedColumn<DateTime?> today = GeneratedColumn<DateTime?>(
      'today', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [initNumber, todaysWord, today];
  @override
  String get aliasedName => _alias ?? 'init_d_b';
  @override
  String get actualTableName => 'init_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<InitDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('init_number')) {
      context.handle(
          _initNumberMeta,
          initNumber.isAcceptableOrUnknown(
              data['init_number']!, _initNumberMeta));
    }
    if (data.containsKey('todays_word')) {
      context.handle(
          _todaysWordMeta,
          todaysWord.isAcceptableOrUnknown(
              data['todays_word']!, _todaysWordMeta));
    } else if (isInserting) {
      context.missing(_todaysWordMeta);
    }
    if (data.containsKey('today')) {
      context.handle(
          _todayMeta, today.isAcceptableOrUnknown(data['today']!, _todayMeta));
    } else if (isInserting) {
      context.missing(_todayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {initNumber};
  @override
  InitDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return InitDBData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InitDBTable createAlias(String alias) {
    return $InitDBTable(_db, alias);
  }
}

abstract class _$InitDBDatabase extends GeneratedDatabase {
  _$InitDBDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $InitDBTable initDB = $InitDBTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [initDB];
}
