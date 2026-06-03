import 'package:floor/floor.dart';

import 'categoria.dart';

@Entity(
  tableName: 'lancamentos',

  foreignKeys: [
    ForeignKey(
      childColumns: ['categoriaId'],
      parentColumns: ['id'],
      entity: Categoria,
    )
  ],
)
class Lancamento {

  @primaryKey
  final int? id;

  final String descricao;
  final double valor;
  final String tipo;
  final String data;

  final int categoriaId;

  Lancamento({
    this.id,
    required this.descricao,
    required this.valor,
    required this.tipo,
    required this.data,
    required this.categoriaId,
  });
}