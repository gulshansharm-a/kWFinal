import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

const TextColor = const Color(0xff002633);
const TextColor2 = const Color(0xff015574);

var x = true;
var y = false;

int text_case = 0;
bool _readOnly = true;

void main() {
  runApp(new MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Webview Demo';
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return new MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: TextColor,
      )),
      title: title,
      // debugShowCheckedModeBanner: false,
      // home: Page1(),

      home: new MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const String flutterUrl = "https://flutter.dev/";
const String wikiUrl = "https://es.wikipedia.org";

class _MyAppState extends State<MyAppHomePage> {
  final _formKey = GlobalKey<FormState>();
  WebViewController _controller;

  _loadPage1() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url = "https://krishworks.com/",
    );
    print(url);
  }

  _loadPage2() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url = "https://krishworks.com/about/",
    );
    print(url);
  }

  _loadPage3() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url = "https://krishworks.com/updates/",
    );
    print(url);
  }

  _loadGallery() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url = "https://krishworks.com/gallery/",
    );
    print(url);
  }

  _loadContactUs() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url = "https://krishworks.com/contact/",
    );
    print(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text("Close", style: TextStyle(color: Colors.white),));
          },
        ),
        title: Text("Setting"),
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: () {
                          _loadGallery();
                          setState(() {
                            x = true;
                            y = false;
                          });
                        },
                        child: Text("Gallery",
                            style: x
                                ? TextStyle(color: Colors.yellow)
                                : TextStyle(color: TextColor2)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (x) {
                                  return TextColor;
                                } else {
                                  return Colors.white;
                                }
                                return null; // Use the component's default.
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    )))),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: () {
                          _loadContactUs();
                          setState(() {
                            x = false;
                            y = true;
                          });
                        },
                        child: Text("Contact Us",
                            style: y
                                ? TextStyle(color: Colors.yellow)
                                : TextStyle(color: TextColor)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (y) {
                                  return TextColor;
                                } else {
                                  return Colors.white;
                                }
                                return null; // Use the component's default.
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    )))),
                  )
                ])),
            Expanded(
              flex: 8,
              child: WebView(
                key: Key("webview"),
                initialUrl: "https://krishworks.com/gallery/",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}