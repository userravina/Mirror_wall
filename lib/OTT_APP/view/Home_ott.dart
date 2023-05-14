import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mirror_wall/OTT_APP/provider/ott_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home_Ott extends StatefulWidget {
  const Home_Ott({Key? key}) : super(key: key);

  @override
  State<Home_Ott> createState() => _Home_OttState();
}

class _Home_OttState extends State<Home_Ott> {
  Ott_Provider? pt, pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Ott_Provider>(context, listen: true);
    pf = Provider.of<Ott_Provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 10.h, width: 300.w, color: Color(0xff1b34d9)),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, bottom: 10, top: 20, right: 10),
                  child: Container(
                    height: 5.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/image/google.png",
                        height: 3.h,
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search here",
                        style: TextStyle(color: Colors.black),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    height: 25.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage("assets/image/ott.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),


              ],
            ),SizedBox(height: 15,),
            SizedBox(height: 100.h,width: 100.w,
              child: Expanded(
                flex: 2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: pf!.name.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pt!.loadlink(index);
                            Navigator.pushNamed(context, 'app',
                                arguments: index);
                          },
                          child: Container(
                            height: 16.h,
                            width: 39.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color(0xff3b57b9), width: 2)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset("${pf!.image[index]}",
                                    fit: BoxFit.cover)),
                          ),
                        ),SizedBox(height: 4,),
                        Text("${pf!.name[index]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
