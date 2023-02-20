import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:push_notification_onesignal/pages/notification_page.dart';
import 'package:push_notification_onesignal/shared/navigation/navigation_service.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter + OneSignal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.navKey,
      debugShowCheckedModeBanner: false,
      home: const MyApp()));
  _oneSignalEvents();
}

void _oneSignalEvents() {
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('bca8fe60-1247-4599-bb65-75d7165056d5');
  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    showDialog(
      context: NavigationService.navKey.currentContext!,
      builder: (context) => const Dialog(
        child: SizedBox(
            width: 400,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                  child: Text(
                      'Função que será executada quando o app recebe uma notificação e o usuário clica sobre esta notificação!')),
            )),
      ),
    );
  });

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    showDialog(
      context: NavigationService.navKey.currentContext!,
      builder: (context) => const Dialog(
        child: SizedBox(
            width: 400,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                  child: Text(
                      'Função que será executada quando o app recebe uma notificação e o aplicativo está em primeiro plano!')),
            )),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Flutter + OneSignal');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToNavigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: const Center(
        child: Text(
          'Dispare a notificação no OneSignal!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToNavigationPage,
        tooltip: 'Go to NavigationPage',
        child: const Icon(Icons.navigation_rounded),
      ),
    );
  }
}
