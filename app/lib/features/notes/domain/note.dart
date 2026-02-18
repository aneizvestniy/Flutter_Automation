/// Note entity (domain layer)
///
/// Domain entities:
/// - contain only data
/// - no Flutter imports
/// - no JSON/DTO concerns
class Note {
  Note({required this.id, required this.title, required this.body, required this.updatedAt});

  final String id;
  final String title;
  final String body;
  final DateTime updatedAt;

  Note copyWith({String? title, String? body, DateTime? updatedAt}) {
    return Note(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
