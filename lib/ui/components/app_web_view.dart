import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  final String url;
  final double statusBarHeight;
  const AppWebView({
    required this.url,
    required this.statusBarHeight,
    super.key,
  });

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  bool isControllerSet = false;
  bool isLoading = true;

  final WebViewController _webViewController = WebViewController();
  @override
  void initState() {
    setController();
    super.initState();
  }

  void setController() async {
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpError: (HttpResponseError error) {},
          onProgress: (progress) {
            if (progress == 100) {
              isLoading = false;
              setState(() {});
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      isControllerSet = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - widget.statusBarHeight,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(
              controller: _webViewController,
            ),
    );
  }
}
