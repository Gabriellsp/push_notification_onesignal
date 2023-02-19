import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:push_notification_onesignal/notification_page.dart';

void main() {
  runApp(const MyApp());
  _oneSignalEvents();
}

void _oneSignalEvents() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('bca8fe60-1247-4599-bb65-75d7165056d5');

  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) => {print('Accepted permission: $accepted')});

  // OneSignal.shared.setNotificationWillShowInForegroundHandler(
  //     (OSNotificationReceivedEvent event) {
  //   // Will be called whenever a notification is received in foreground
  //   // Display Notification, pass null param for not displaying the notification
  //   event.complete(event.notification);
  // });

  // OneSignal.shared
  //     .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //   navigatorKey.currentState!.push(
  //     MaterialPageRoute(
  //       builder: (context) => const NotificationPage(),
  //     ),
  //   );
  //   // Will be called whenever a notification is opened/button pressed.
  // });

  // OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
  //   // Will be called whenever the permission changes
  //   // (ie. user taps Allow on the permission prompt in iOS)
  // });

  // OneSignal.shared
  //     .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
  //   // Will be called whenever the subscription changes
  //   // (ie. user gets registered with OneSignal and gets a user ID)
  // });

  // OneSignal.shared.setEmailSubscriptionObserver(
  //     (OSEmailSubscriptionStateChanges emailChanges) {
  //   // Will be called whenever then user's email subscription changes
  //   // (ie. OneSignal.setEmail(email) is called and the user gets registered
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
