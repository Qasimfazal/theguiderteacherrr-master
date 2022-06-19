import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theguiderteacherrr/Data/attendance.dart';
import 'package:theguiderteacherrr/Model/Online_Madarsa_List.dart';
import 'package:theguiderteacherrr/widget/Appbar.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool _loading = true;
  @override
  void Data_Generator() async {
    await DataRetrive.Retrieve();

    setState(() {});
  }
  void initState() {
    super.initState();
    Data_Generator();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
    SystemNavigator.pop();
  }
  Widget build(BuildContext context) {
    return _loading ? Center(child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          //   color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10))
            ]),
        child: CircularProgressIndicator())) : Scaffold(

      body:  Container(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/light-1.png'))),
                      )),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/light-2.png'))),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/clock.png'))),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    _signOut();
                                  },
                                  child: Icon(
                                    Icons.power_settings_new,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 25,
                              ),
                           //   Text('Teacher Portal',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text('Teacher Portal',style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.w300),),
            ),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    //childAspectRatio: (itemWidth / itemHeight),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                itemCount: madarsaList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                madarsaList[index].navigation));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(madarsaList[index].image),
                            fit: BoxFit.cover,
                          ),
                          //color: const Color(0xff7c94b6),
                          border: Border.all(
                            color: Colors.grey,
                           // width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.indigoAccent.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset:
                                  Offset(1, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(madarsaList[index].destination),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
