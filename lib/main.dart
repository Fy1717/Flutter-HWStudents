import 'package:flutter/material.dart';
import 'package:flutter_ilk_app/models/student.dart';
import 'package:flutter_ilk_app/screens/student_add.dart';
import 'package:flutter_ilk_app/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String appbarTitle = "SINAV SONUÇLARI";
  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Furkan", "Yıldız", 30, "https://media-exp1.licdn.com/dms/image/C4D03AQF3bj4dw-W1tg/profile-displayphoto-shrink_400_400/0/1581778541939?e=1621468800&v=beta&t=DF8txdd46MvvXuDAUXw75Nzl8X7sGF89bX65utpsUqc"),
    Student.withId(2, "Oğuz", "Demir", 60, "https://media-exp1.licdn.com/dms/image/C4D03AQE5Qr1_4wWmPQ/profile-displayphoto-shrink_400_400/0/1614017716498?e=1621468800&v=beta&t=SFCeRFeim2Gu_N5JdIRrkW6f0DNXoKVmhboa7FQFEPw"),
    Student.withId(3, "Kadriye", "Macit", 100, "https://miro.medium.com/fit/c/131/131/1*n0M_2hwRDlPUfUgDqszTdg.jpeg"),
    Student.withId(4, "Nur", "Korkmaz", 100, "https://media-exp1.licdn.com/dms/image/C4E03AQFlL3B_nb55Ug/profile-displayphoto-shrink_400_400/0/1603368147479?e=1621468800&v=beta&t=_JGfJiI3wnnaG8I7yGt8O2LW_xwIPFS1OJ51n0Nmtco")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbarTitle)),
      body: buildBody(context)
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(students[index].image),
                  ),
                  title: Text(students[index].firstName + " " + students[index].lastName),
                  subtitle: Text("Aldığı Not: " + students[index].grade.toString() +
                      "  [" + students[index].getStatus + "]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });

                    print(students[index].firstName + " " + students[index].lastName);
                  },
                );
              }),
        ),
        Text('Seçilen Kişi : ' + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                        width: 5.0
                    ),
                    Text("ADD"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students))); // Tıklandığında bu class a git
                },
              ),
            ), Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                color: Colors.grey,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0
                    ),
                    Text("UPDATE"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent)));
                },
              ),
            ), Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                        width: 5.0
                    ),
                    Text("DELETE"),
                  ],
                ),
                onPressed: () {
                  var mesaj = selectedStudent.firstName + " - SİLİNDİ";

                  mesajGoster(context, mesaj);

                  setState(() {
                    students.remove(selectedStudent);
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 75) {
      return Icon(Icons.done);
    } else if (grade >= 50) {
      return Icon(Icons.anchor_sharp);
    } else if (grade >= 45) {
      return Icon(Icons.anchor_sharp);
    } else {
      return Icon(Icons.clear);
    }
  }
}

