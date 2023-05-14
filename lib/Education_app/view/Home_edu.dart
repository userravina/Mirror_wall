import 'package:flutter/material.dart';
import 'package:mirror_wall/Education_app/provider/education_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home_edu extends StatefulWidget {
  const Home_edu({Key? key}) : super(key: key);

  @override
  State<Home_edu> createState() => _Home_eduState();
}

class _Home_eduState extends State<Home_edu> {
  Education_app? ht, hf;

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<Education_app>(context, listen: true);
    hf = Provider.of<Education_app>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 900,
              child: Column(children: [
                Stack(
                  children: [
                    Container(
                      height: 21.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Color(0xff3b57b9),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        Icons.border_all_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 320),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 50, left: 15),
                        child: Text(
                          "Hi, Education App",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 90, left: 15),
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search here..",
                              style: TextStyle(color: Colors.black),
                            )
                          ]),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "${hf!.image[index]}",
                            ),
                            radius: 30,
                            // borderRadius: BorderRadius.circular(15),
                          ),
                          Text(
                            "${hf!.name[index]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    },
                    itemCount: hf!.name.length,
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 15,left: 15),
                      child: Text(
                        "All Education App",
                        style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: hf!.name2.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              ht!.loadWebsite(index);
                              Navigator.pushNamed(context, 'app',
                                  arguments: index);
                            },
                            child: Container(
                              height: 17.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Color(0xff3b57b9), width: 2)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset("${hf!.image2[index]}",
                                      fit: BoxFit.cover)),
                            ),
                          ),SizedBox(height: 4,),
                          Text("${hf!.name2[index]}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ],
                      );
                    },
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    ));
  }
}
