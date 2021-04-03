class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "AD ATTRIBUTE U EN AZ 2 KARAKTER İÇERMELİDİR";
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "SOYAD ATTRIBUTE U EN AZ 2 KARAKTER İÇERMELİDİR";
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);

    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır";
    }
  }
}