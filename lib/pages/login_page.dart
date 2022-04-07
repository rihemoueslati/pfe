
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forum_republique/common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Image(
                       image: NetworkImage('https://scontent.ftun16-1.fna.fbcdn.net/v/t1.6435-9/117648424_637219530239329_370547406072171631_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=IJP7mn7-VbUAX-x6uu9&_nc_ht=scontent.ftun16-1.fna&oh=00_AT-X5hFeJFztuQiKh0ICWQdt6FYDk_n-pHpkA6uZk_9VFw&oe=62583FE2'),
                      height: 100,
                      width: 100,
                    ),
                    Text(
                        'FORUM DE LA REPUBLIQUE',
                      style: TextStyle(
                          color: Colors.red,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      'connectez-vous à votre compte',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration('Nom d\'utilisateur', 'Entrez votre nom d\'utilisateur'
                                ),
                                  validator: (val) {
                                    if (val!.isEmpty)
                                      return  "Entrer votre nom !";
                                  }

                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextFormField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Mot de passe', 'Entrez votre Mot de passe'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Entrer votre mot de passe";
                                    } else if (val.length<8) {
                                      return "Entrer un mot de passe valide";
                                    }
                                  }
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: Text( "Mot de passe oublié?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('identifier'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => ProfilePage()
                                        ),
                                            (Route<dynamic> route) => false
                                    );
                                  }
                                  //After successful login we will redirect to profile page. Let's create profile page now

                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "vous n'avez pas de compte? "),
                                    TextSpan(
                                      text: 'Créer',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}
