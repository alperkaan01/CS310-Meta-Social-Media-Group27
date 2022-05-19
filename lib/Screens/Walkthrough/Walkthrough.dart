import 'package:flutter/material.dart';
import 'AppColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
void main(){
  
  runApp(const MyApp());
  

}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int? firstLoad;
  SharedPreferences? prefs;

  decideRoute() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstLoad = (prefs!.getInt('appInitialLoad') ?? 0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decideRoute();
  }

  @override
  Widget build(BuildContext context) {
    if(firstLoad == null) {
      return Container();
    } else if(firstLoad == 0) {
      firstLoad = 1;
      prefs!.setInt('appInitialLoad', firstLoad!);
      return MaterialApp(
        home: Walkthrough(),
      );
    } else {
      return MaterialApp(
        home: Login(),
      );
    }
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        
      ),
    );
  }
}

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Walkthrough'),
        backgroundColor: AppColor.WelcomeBackground,

      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
        },
        children: [
          Container(
            color: AppColor.SecondMainColor,
            child: const Center(child: Text('Page1')),
          ),
          Container(
            color: AppColor.SecondMainColor,
            child: const Center(child: Text('Page2')),
          ),
          Container(
            color: AppColor.SecondMainColor,
            child: const Center(child: Text('Page3')),
          ),
        ],

      ),
      ),
    bottomSheet: isLastPage?
          TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90)
        ),
        primary: AppColor.homePageBackground,
        backgroundColor: AppColor.SecondMainColor,
        minimumSize: const Size.fromHeight(80),
      ),
          onPressed: () async {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage() ) ,

            );
          },
          child: const Text('Get Started',
          style: TextStyle(fontSize: 24)),
    )
        : Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
         height: 80,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: () => controller.jumpToPage(2),
              child: const Text('SKIP')),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                spacing: 16,
                dotColor: AppColor.homePageSubtitle,
                activeDotColor: AppColor.homePageTitle,

              ),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn)
            ),
          ),
          TextButton(onPressed: () => controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut),
              child: const Text('NEXT')),
        ],
      ),
    ),
    );
  }

