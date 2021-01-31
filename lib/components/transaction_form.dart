import 'package:flutter/material.dart';
import 'adaptative_date_picker.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate;

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) return;
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    print('build() Transaction form');
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdaptativeTextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              labelText: 'Título',
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AdaptativeTextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: valueController,
                onSubmitted: (_) => _submitForm(),
                labelText: 'Valor (R\$)',
              ),
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                  label: '+ Nova Transação',
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
