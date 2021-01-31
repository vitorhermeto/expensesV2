import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionItem extends StatefulWidget {
  final Transaction tr;
  final ThemeData theme;
  final void Function(String p1) onRemove;

  const TrasactionItem({
    Key key,
    @required this.tr,
    @required this.theme,
    @required this.onRemove,
  }) : super(key: key);

  @override
  _TrasactionItemState createState() => _TrasactionItemState();
}

class _TrasactionItemState extends State<TrasactionItem> {
  static const colors = [
    Colors.purple,
    Colors.indigo,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
  ];

  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(4);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: widget.theme.textTheme.headline1,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                textColor: widget.theme.errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}
