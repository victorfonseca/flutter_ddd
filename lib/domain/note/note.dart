import 'package:meta/meta.dart' show required;
import 'package:flutter_ddd/domain/category/value/category_id.dart';
import 'package:flutter_ddd/domain/note/value/note_body.dart';
import 'package:flutter_ddd/domain/note/value/note_id.dart';
import 'package:flutter_ddd/domain/note/value/note_title.dart';

export 'package:flutter_ddd/domain/category/value/category_id.dart';
export 'package:flutter_ddd/domain/note/value/note_body.dart';
export 'package:flutter_ddd/domain/note/value/note_id.dart';
export 'package:flutter_ddd/domain/note/value/note_title.dart';

class Note {
  final NoteId id;
  NoteTitle _title;
  NoteBody _body;
  CategoryId _categoryId;

  Note({
    @required this.id,
    @required NoteTitle title,
    @required NoteBody body,
    @required CategoryId categoryId,
  })  : _title = title,
        _body = body,
        _categoryId = categoryId;

  NoteTitle get title => _title;
  NoteBody get body => _body;
  CategoryId get categoryId => _categoryId;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is Note && other.id == id);

  @override
  int get hashCode => id.hashCode;

  void changeTitle(NoteTitle newTitle) {
    _title = newTitle;
  }

  void changeBody(NoteBody newBody) {
    _body = newBody;
  }

  void changeCategory(CategoryId newCategoryId) {
    _categoryId = newCategoryId;
  }
}
