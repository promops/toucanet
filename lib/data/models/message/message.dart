class Message {
  Message({
    this.id,
    this.date,
    this.fromId,
    this.readState,
    this.text,
    this.out,
  });

  final int id;
  final int date;

  final int fromId;
  final int readState;
  final String text;

  int out;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      date: json['date'],
      fromId: json['from_id'],
      text: json['text'],
      out: json['out'],
    );
  }

  @override
  String toString() => '$id $text';
}
