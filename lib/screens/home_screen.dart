import 'package:flutter/material.dart';

import '../main.dart';

import '../database/entities/lancamento.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Controle Financeiro',
        ),
      ),

      body: StreamBuilder<List<Lancamento>>(
        stream: database
            .lancamentoDao
            .listarLancamentos(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          final lancamentos =
              snapshot.data!;

          if (lancamentos.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum lançamento cadastrado',
              ),
            );
          }

          return ListView.builder(
            itemCount: lancamentos.length,

            itemBuilder: (context, index) {

              final item =
                  lancamentos[index];

              return Card(
                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                child: ListTile(
                  title: Text(
                    item.descricao,
                  ),

                  subtitle: Text(
                    '${item.tipo} - ${item.data}',
                  ),

                  trailing: Text(
                    'R\$ ${item.valor}',
                  ),

                  onLongPress: () async {

                    await database
                        .lancamentoDao
                        .deletarLancamento(
                      item,
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () async {

          await database
              .lancamentoDao
              .inserirLancamento(
            Lancamento(
              descricao: 'Mercado',
              valor: 150,
              tipo: 'despesa',
              data: '14/05/2026',
              categoriaId: 1,
            ),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}