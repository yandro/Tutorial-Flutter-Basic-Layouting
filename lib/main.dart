import 'package:flutter/material.dart';

//main di eksekusi saat aplikasi pertama kali di jalankan
void main() => runApp(MyApp(tittle: "dasds",));

//MyApp adalah kelas yang pertama kali di jalankan
//sesuai dengan yang sudah di deklarasikan di "main => runApp"
class MyApp extends StatelessWidget {
  //constructor kelas
  const MyApp({Key key, this.tittle}) : super(key: key);
  //parameter di deklarasikan dengan final dan di masukkan ke constructor
  final String tittle;
  
  //widget build merupakan method yang pertama kali
  //dijalankan pada kelas ini
  //seperti  onCreate pada android studio
  @override
  Widget build(BuildContext context) {
    //Material app merupakan setting pada seluruh aplikasi
    return MaterialApp(
      //home perupakan tampilan utama, disini tampilan utamanya adalah MyLoginPage
      home: MyLoginPage(title: "Login",),
      //ThemeData berisi tema aplikasi seperti warna toolbar dsb
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
    );
  }
}

//MyLoginPage ini adalah statefulWidget artinya
//UI bisa berubah jika statenya berubah
class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;
  _MyLoginPageState createState() => _MyLoginPageState();
}
//statefulWidget perlu state
//maka dibawah ini meruppakan state dari kelas MyLoginPage
class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    
    //field email
    final emailField = TextField(
      obscureText: false,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
      ),
    );

    //field password
    final passwordField = TextField(
      obscureText: true,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
      ),
    );

    //button login
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.pinkAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PageTwo()
          ));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    //pada return value ini merupakan tampilan yang akan muncul pada aplikasi
    return Scaffold(
      body: SingleChildScrollView(
        //column digunakan untuk menyusun tampilan secara vertical
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/flutter.png",
                      fit: BoxFit.contain,),  
                  ),
                  SizedBox(height: 40.0,),
                  emailField,
                  SizedBox(height: 16.0,),
                  passwordField,
                  SizedBox(height: 45.0,),
                  loginButton,
                  SizedBox(height: 15.0,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PageTwo extends StatelessWidget {
  const PageTwo({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
      ),
    );
  }
}

