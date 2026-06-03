// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoriaDao? _categoriaDaoInstance;

  LancamentoDao? _lancamentoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categorias` (`id` INTEGER, `nome` TEXT NOT NULL, `cor` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `lancamentos` (`id` INTEGER, `descricao` TEXT NOT NULL, `valor` REAL NOT NULL, `tipo` TEXT NOT NULL, `data` TEXT NOT NULL, `categoriaId` INTEGER NOT NULL, FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoriaDao get categoriaDao {
    return _categoriaDaoInstance ??= _$CategoriaDao(database, changeListener);
  }

  @override
  LancamentoDao get lancamentoDao {
    return _lancamentoDaoInstance ??= _$LancamentoDao(database, changeListener);
  }
}

class _$CategoriaDao extends CategoriaDao {
  _$CategoriaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _categoriaInsertionAdapter = InsertionAdapter(
            database,
            'categorias',
            (Categoria item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cor': item.cor
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Categoria> _categoriaInsertionAdapter;

  @override
  Stream<List<Categoria>> listarCategorias() {
    return _queryAdapter.queryListStream('SELECT * FROM categorias',
        mapper: (Map<String, Object?> row) => Categoria(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            cor: row['cor'] as String),
        queryableName: 'categorias',
        isView: false);
  }

  @override
  Future<void> inserirCategoria(Categoria categoria) async {
    await _categoriaInsertionAdapter.insert(
        categoria, OnConflictStrategy.abort);
  }
}

class _$LancamentoDao extends LancamentoDao {
  _$LancamentoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _lancamentoInsertionAdapter = InsertionAdapter(
            database,
            'lancamentos',
            (Lancamento item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'valor': item.valor,
                  'tipo': item.tipo,
                  'data': item.data,
                  'categoriaId': item.categoriaId
                },
            changeListener),
        _lancamentoUpdateAdapter = UpdateAdapter(
            database,
            'lancamentos',
            ['id'],
            (Lancamento item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'valor': item.valor,
                  'tipo': item.tipo,
                  'data': item.data,
                  'categoriaId': item.categoriaId
                },
            changeListener),
        _lancamentoDeletionAdapter = DeletionAdapter(
            database,
            'lancamentos',
            ['id'],
            (Lancamento item) => <String, Object?>{
                  'id': item.id,
                  'descricao': item.descricao,
                  'valor': item.valor,
                  'tipo': item.tipo,
                  'data': item.data,
                  'categoriaId': item.categoriaId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Lancamento> _lancamentoInsertionAdapter;

  final UpdateAdapter<Lancamento> _lancamentoUpdateAdapter;

  final DeletionAdapter<Lancamento> _lancamentoDeletionAdapter;

  @override
  Stream<List<Lancamento>> listarLancamentos() {
    return _queryAdapter.queryListStream('SELECT * FROM lancamentos',
        mapper: (Map<String, Object?> row) => Lancamento(
            id: row['id'] as int?,
            descricao: row['descricao'] as String,
            valor: row['valor'] as double,
            tipo: row['tipo'] as String,
            data: row['data'] as String,
            categoriaId: row['categoriaId'] as int),
        queryableName: 'lancamentos',
        isView: false);
  }

  @override
  Stream<List<Lancamento>> filtrarPorTipo(String tipo) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM lancamentos     WHERE tipo = ?1',
        mapper: (Map<String, Object?> row) => Lancamento(
            id: row['id'] as int?,
            descricao: row['descricao'] as String,
            valor: row['valor'] as double,
            tipo: row['tipo'] as String,
            data: row['data'] as String,
            categoriaId: row['categoriaId'] as int),
        arguments: [tipo],
        queryableName: 'lancamentos',
        isView: false);
  }

  @override
  Stream<List<Lancamento>> filtrarPorCategoria(int categoriaId) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM lancamentos     WHERE categoriaId = ?1',
        mapper: (Map<String, Object?> row) => Lancamento(
            id: row['id'] as int?,
            descricao: row['descricao'] as String,
            valor: row['valor'] as double,
            tipo: row['tipo'] as String,
            data: row['data'] as String,
            categoriaId: row['categoriaId'] as int),
        arguments: [categoriaId],
        queryableName: 'lancamentos',
        isView: false);
  }

  @override
  Future<double?> calcularSaldo() async {
    return _queryAdapter.query(
        'SELECT SUM(       CASE         WHEN tipo = \'receita\' THEN valor         ELSE -valor       END     )     FROM lancamentos',
        mapper: (Map<String, Object?> row) => row.values.first as double);
  }

  @override
  Future<void> inserirLancamento(Lancamento lancamento) async {
    await _lancamentoInsertionAdapter.insert(
        lancamento, OnConflictStrategy.abort);
  }

  @override
  Future<void> atualizarLancamento(Lancamento lancamento) async {
    await _lancamentoUpdateAdapter.update(lancamento, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletarLancamento(Lancamento lancamento) async {
    await _lancamentoDeletionAdapter.delete(lancamento);
  }
}
