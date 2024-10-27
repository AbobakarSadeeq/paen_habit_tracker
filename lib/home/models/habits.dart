class Habits {
  int? habitID;
  String? habitName;
  String? created_At;

  Habits(
      {required this.habitID,
      required this.habitName,
      required this.created_At});

  // if fetching from db got any issue then make the below function to resolve it.
  // factory Habits.fromJsonCapitalLetterObjectName() {
  //   return Habits(
  //     messageDateStamp: json['MessageDateStamp'],
  //     messageTimeStamp: json['MessageTimeStamp'],
  //     messageSeen: json['MessageSeen'],
  //     userMessage: json['UserMessage'],
  //     senderContactNumber: json['SenderContactNumber'],
  //     receiverContactNumber: json['ReceiverContactNumber'],
  //     groupId: groupId,
  //   );
  // }
}
