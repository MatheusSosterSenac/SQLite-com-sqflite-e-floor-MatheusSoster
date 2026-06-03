import 'package:floor/floor.dart';

import '../entities/lancamento.dart';

@dao
abstract class LancamentoDao {

  @Query('SELECT * FROM lancamentos')
  Stream<List<Lancamento>> listarLancamentos();

  @insert
  Future<void> inserirLancamento(
    Lancamento lancamento,
  );

  @update
  Future<void> atualizarLancamento(
    Lancamento lancamento,
  );

  @delete
  Future<void> deletarLancamento(
    Lancamento lancamento,
  );

  @Query('''
    SELECT * FROM lancamentos
    WHERE tipo = :tipo
  ''')
  Stream<List<Lancamento>> filtrarPorTipo(
    String tipo,
  );

  @Query('''
    SELECT * FROM lancamentos
    WHERE categoriaId = :categoriaId
  ''')
  Stream<List<Lancamento>> filtrarPorCategoria(
    int categoriaId,
  );

  @Query('''
    SELECT SUM(
      CASE
        WHEN tipo = 'receita' THEN valor
        ELSE -valor
      END
    )
    FROM lancamentos
  ''')
  Future<double?> calcularSaldo();
}