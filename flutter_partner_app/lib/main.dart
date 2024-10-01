// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnpt_smartca_module/main.dart';

void main() {
  runZonedGuarded(() async {
    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    // debugPrint("error log ${error}");
  });
}

@pragma('vm:entry-point')
void VNPTSmartCAEntryponit() => bootstrapSmartCAApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
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
  static const platform = MethodChannel("com.vnpt.flutter/partner");

  Future<void> getAuthentication() async {
    await platform.invokeMethod('getAuthentication');
  }

  Future<void> getWaitingTransaction() async {
    await platform.invokeMethod('getWaitingTransaction',"12131");
  }

  Future<void> toMainPage() async {
    await platform.invokeMethod('getMainInfo');
  }

  Future<void> createAccount() async {
    await platform.invokeMethod('createAccount');
  }

  Future<void> signOut() async {
    await platform.invokeMethod('signOut');
  }

  initMethod(BuildContext context) {
    platform.setMethodCallHandler((call) async {
      if (call.method == "getAuthenticationResult") {
        debugPrint("getAuthenticationResult");
        if (call.arguments is Map && call.arguments["status"] == 0) {
          // Xử lý khi thành công
          showDialogMessage(context, call.arguments["data"]);
        } else {
          // Xử lý khi thất bại
        }
      } else if (call.method == "getMainInfoResult") {
        debugPrint("getMainInfoResult");
      } else if (call.method == "getWaitingTransactionResult") {
        debugPrint("getWaitingTransactionResult");
        if (call.arguments is Map && call.arguments["status"] == 0) {
          // Xử lý khi thành công
          showDialogMessage(
              context, "Giao dịch thành công: ${call.arguments["statusDesc"]}");
        } else {
          // Xử lý khi thất bại
          showDialogMessage(
              context, "Giao dịch thất bại: ${call.arguments["statusDesc"]}");
        }
      } else if (call.method == "signOutResult") {
        debugPrint("signOut success");
        showDialogMessage(context, "Đăng xuất thành công");
      } else if (call.method == "createAccountResult") {
        debugPrint("createAccountResult");
      }
    });
  }

  showDialogMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Dialog Title'),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initMethod(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: createAccount, child: Text("createAccount")),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: getAuthentication, child: Text("getAuthentication")),
            SizedBox(height: 30),
            ElevatedButton(onPressed: toMainPage, child: Text("getMainPage")),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: getWaitingTransaction,
                child: Text("getWaitingTransaction")),
            SizedBox(height: 30),
            ElevatedButton(onPressed: signOut, child: Text("sign Out"))
          ],
        ),
      ),
    );
  }
}
