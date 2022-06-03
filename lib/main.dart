import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cs310_mainproject/Screens/HomePage/Homepage.dart';
import 'package:cs310_mainproject/Screens/Profile/Profile_posts.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'Object Classes/auth.dart';
import 'Object Classes/colors.dart' as color;
import 'package:cs310_mainproject/Screens/Welcome/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;


  FirebaseAnalyticsObserver appAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: analytics);

  runApp(MaterialApp(
      home: OurFireBaseApp(analytics: analytics , observer: appAnalyticsObserver(),)
  ));


}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.network("https://assets10.lottiefiles.com/private_files/lf30_fhbalxer.json"),
      splashIconSize: 2000,
      //backgroundColor: Colors.deepPurpleAccent,
      nextScreen: WelcomeScreen(analytics: analytics, observer: observer,),
      //nextScreen: const ProfileEdit(),
      animationDuration: const Duration(seconds: 3,),
      backgroundColor: color.AppColor.WelcomeBackground,
    );
  }
}




class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.analytics, required this.observer}) : super(key: key);
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

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
        theme: ThemeData(
          primaryColor: color.AppColor.secondPageTopIconColor,
          scaffoldBackgroundColor: color.AppColor.WelcomeBackground,
        ),
        home: Walkthrough(analytics: widget.analytics, observer: widget.observer,),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: color.AppColor.secondPageTopIconColor,
          scaffoldBackgroundColor: color.AppColor.WelcomeBackground,
        ),
        home: SplashScreen(analytics: widget.analytics,observer: widget.observer,),
      );
    }
  }
}



class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

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
      backgroundColor: color.AppColor.WelcomeBackground,

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
            color: color.AppColor.SecondMainColor,
            child: Center(child: Image.asset(
              'assets/images/Walkthrough1.png',
            )),
          ),
          Container(
            color: color.AppColor.SecondMainColor,
            child: Center(child: Image.asset(
              'assets/images/Walkthrough2.png',
            )),
          ),
          Container(
            color: color.AppColor.SecondMainColor,
            child: Center(child: Image.asset(
              'assets/images/Walkthrough3.png',
            )),
          ),
        ],

      ),
    ),
    bottomSheet: isLastPage?
    TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(90)
        ),
        primary: color.AppColor.homePageBackground,
        backgroundColor: color.AppColor.SecondMainColor,
        minimumSize: const Size.fromHeight(80),
      ),
      onPressed: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> WelcomeScreen(analytics: widget.analytics,observer: widget.observer,) ) ,

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
                  dotColor: color.AppColor.homePageSubtitle,
                  activeDotColor: color.AppColor.homePageTitle,

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
class OurFireBaseApp extends StatelessWidget {

  OurFireBaseApp({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final Future<FirebaseApp> _init = Firebase.initializeApp();

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return ErrorScreen(message: snapshot.error.toString(),);

          }
          if(snapshot.connectionState == ConnectionState.done){
            //return MyApp();
            return StreamProvider<User?>.value(
              value: AuthService().user,
              initialData: null,
              child: AuthenticationStatus(analytics: analytics,observer: observer,),
            );
          }
          return const WaitingScreen();

        });
  }
}

class AuthenticationStatus extends StatefulWidget {
  const AuthenticationStatus({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<AuthenticationStatus> createState() => _AuthenticationStatusState();
}

class _AuthenticationStatusState extends State<AuthenticationStatus> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if(user == null){
      return WelcomeScreen(analytics: widget.analytics, observer: widget.observer,);
    }
    else{
      return HomePage(analytics: widget.analytics, observer: widget.observer,);
    }
  }
}



class ErrorScreen extends StatelessWidget {
  ErrorScreen({Key? key, required this.message}) : super(key: key);

  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CS310'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text('Connecting Aga'),
    );
  }
}




