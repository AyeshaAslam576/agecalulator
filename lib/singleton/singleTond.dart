class SingleTon{
  static  final SingleTon role=SingleTon._internal();
  factory SingleTon()=>role;
  SingleTon._internal();
  bool? isFromResultSave;
  bool? isFromAgeCalculator;
  bool? isFromFav;
  bool? isFromResultEdit;
  bool? isFromAgeFormSave;
  int? userId;
  String? userName;
  String? userGender;
  String? eventSelection;
  DateTime? DateOfBirthToCalculate;
   int? yearsOld;
   DateTime? dateOfBirth;
   DateTime? upcomingBirthday;
  DateTime?creationDate;
   String userPath = '';


}