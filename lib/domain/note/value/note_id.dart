import 'package:meta/meta.dart' show immutable;
import 'package:flutter_ddd/common/exception.dart';

@immutable
class NoteId {
  final String value;

  NoteId(this.value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException('Note ID');
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is NoteId && other.value == value);

  @override
  int get hashCode => value.hashCode;
}
