import 'package:flutter/material.dart';
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
          children: [  GradientAppBar("Teacher Portal"),
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
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                madarsaList[index].navigation));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(madarsaList[index].image,),
                            fit: BoxFit.cover,
                          ),
                          //color: const Color(0xff7c94b6),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.45),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset:
                                  Offset(1, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
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
