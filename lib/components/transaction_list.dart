import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TrasactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    print('build() Transaction list');
    final theme = Theme.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (cxt, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Text(
                    'Nenhuma Transação Cadastrada',
                    style: theme.textTheme.headline1,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        // : ListView.builder(
        //     itemCount: transactions.length,
        //     itemBuilder: (ctx, index) {
        //       final tr = transactions[index];
        //       return TrasactionItem(
        //         tr: tr,
        //         theme: theme,
        //         onRemove: onRemove,
        //       );
        //     },
        //   );
        : ListView(
            children: transactions.map((tr) {
              return TrasactionItem(
                key: ValueKey(tr.id),
                tr: tr,
                theme: theme,
                onRemove: onRemove,
              );
            }).toList(),
          );
  }
}
