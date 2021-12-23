import 'package:flutter/material.dart';
import 'package:theguiderteacherrr/Model/Online_Madarsa_List.dart';
import 'package:theguiderteacherrr/global.dart';

class HomeScreen extends StatefulWidget {
  // const OnlineMadarsa({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:  _loading ? Center(child: Container(
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
          child: CircularProgressIndicator())) : Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
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
                            image: AssetImage(madarsaList[index].image),
                            fit: BoxFit.cover,
                          ),
                          //color: const Color(0xff7c94b6),
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurpleAccent.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(1, 3), // changes position of shadow
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
