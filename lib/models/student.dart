class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String image;
  String _status;

  Student.withId(int id, String firstName, String lastName, int grade, String image) { // otomatik hesap için "status" eklenmedi
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  Student(String firstName, String lastName, int grade, String image) { // otomatik hesap için "status" eklenmedi
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  Student.withoutInfo() {}

  String get getFirstName {
    return "OGR - " + this.firstName;
  }

  void set setFirstName (String value) {
    this.firstName = value;
  }

  String get getStatus {
    String message = "";

    if (this.grade >= 55) {
      message = 'Geçer Not';
    } else if (this.grade >= 45) {
      message = 'Bütünleme';
    } else {
      message = 'Kaldı';
    }

    return message;
  }

}