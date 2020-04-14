class Message {
  Message(
      {this.id, this.date, this.fromId, this.readState, this.text, this.direction});
  final int id;
  final int date;

  final int fromId;
  final int readState;
  final String text;

  final MessageDirection direction;



  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      date: json['friends'],

      fromId: json['user_id'],
      text: json['title'],
    );
  }

  @override
  String toString() => '$id $text';
}

enum MessageDirection { IN, OUT}
