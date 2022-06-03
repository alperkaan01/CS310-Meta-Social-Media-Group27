import 'package:firebase_analytics/firebase_analytics.dart';

  setUserName(FirebaseAnalytics analytics,String username){
    analytics.setUserProperty(
        name: username,
        value: '',
    );
  }

setCurrentScreen(FirebaseAnalytics analytics,String screenName, String screenClass){
    analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenClass,
    );
  }

  logCustomEvent(FirebaseAnalytics analytics,String logName, Map<String, dynamic> map){
    analytics.logEvent(
        name: logName,
        parameters: map,
    );
  }

  logAppOpen(FirebaseAnalytics analytics){
    analytics.logAppOpen();
  }

  logTutorialBegin(FirebaseAnalytics analytics){
    analytics.logTutorialBegin();
  }

  logTutorialComplete(FirebaseAnalytics analytics){
    analytics.logTutorialComplete();
  }

  logSignUp(FirebaseAnalytics analytics) {
    analytics.logSignUp(signUpMethod: 'email');
  }

  logLogin(FirebaseAnalytics analytics) {
    analytics.logLogin(loginMethod: 'email');
  }

