import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun{
  static openLink(String LinkNews)async{
    if (!await launch(LinkNews)) throw 'Could not launch $LinkNews';
  }
  static copyLink(String LinkNews){
    FlutterClipboard.copy('News App');
  }
  static shareLink(String LinkNews){
    Share.share('News app $LinkNews');
  }
}