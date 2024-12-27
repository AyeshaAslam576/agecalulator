class User {
  int? id;
  String userName;
  DateTime dateOfBirth;
  DateTime upcomingDateOfBirth;
  int yearsOld;
  String gender;
  String event;
  DateTime createdDate;
  User({
    this.id,
    required this.userName,
    required this.dateOfBirth,
    required this.upcomingDateOfBirth,
    required this.yearsOld,
    required this.gender,
    required this.event,
    required this.createdDate,
  });

  User.fromMap(Map<String, dynamic> agecal)
      : id = agecal["id"],
        userName = agecal["userName"],
        dateOfBirth = DateTime.parse(agecal["dateOfBirth"]),
        upcomingDateOfBirth = DateTime.parse(agecal["upcomingDateOfBirth"]),
        yearsOld =agecal["yearsOld"],
        gender = agecal["gender"],
        event = agecal["event"],
  createdDate = DateTime.parse(agecal["createdDate"]);
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'userName': userName,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'upcomingDateOfBirth': upcomingDateOfBirth.toIso8601String(),
      'yearsOld': yearsOld,
      'gender': gender,
      'event': event,
      'createdDate':createdDate.toIso8601String(),
    };
  }
}
