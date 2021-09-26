import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/icons/all_backarrow_white.webp",
            height: 30,
            color: Colors.white,
          ).pOnly(top: 50, right: 300, bottom: 0).onTap(() {
            Navigator.pop(context);
          }),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: Container(
                width: 350,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Developed By:",
                          style: TextStyle(color: AppColors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Innividio Apps",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/appicon.png",
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Version :",
                          style: TextStyle(color: AppColors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "2.0",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Men Fitness is a fully customized workout plan app for men. Providing the pro builtin 4-weeks fitness challenges.",
                        style: TextStyle(color: AppColors.greyDim),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
