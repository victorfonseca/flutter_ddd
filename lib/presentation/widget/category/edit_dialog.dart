import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ddd/presentation/widget/error_dialog.dart';

typedef SaveCallback = Future<void> Function({@required String name});

class CategoryEditDialog extends StatelessWidget {
  final BuildContext _context;
  final String heading;
  final String buttonLabel;
  final SaveCallback onSave;
  final TextEditingController _nameController;

  CategoryEditDialog({
    @required BuildContext context,
    @required this.heading,
    @required this.buttonLabel,
    @required this.onSave,
    String initialName,
  })  : _context = context,
        _nameController = Provider.of<TextEditingController>(context)
          ..text = initialName ?? '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(heading),
          content: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter category name',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text(buttonLabel),
              onPressed: () async => _onPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void show() {
    showDialog<void>(
      context: _context,
      builder: build,
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    try {
      await onSave(name: _nameController.text);
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      ErrorDialog(
        context: _context,
        message: e.toString(),
        onConfirm: show,
      ).show();
    }
  }
}
