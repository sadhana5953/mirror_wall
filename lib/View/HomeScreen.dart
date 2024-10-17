import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mirror_wall/Controller/search_engine_controller.dart';
import 'package:mirror_wall/View/searchDataScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var SearchController = Get.put(SearchEngine());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Browser'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    SearchController.getData();
                    SearchController.getUrlData();
                    showDialog(context: context, builder: (context) {
                      return Dialog(
                        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      insetPadding: EdgeInsets.all(5),
                        child: Obx(
                          () =>  Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: (SearchController.searchData.value.length==0)?Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: Color(0xfff5f0f8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                                            IconButton(onPressed: () {
                                                              Navigator.pop(context);
                                                          }, icon: Icon(CupertinoIcons.multiply,color: Color(0xff624ba0),)),
                                      Text('DISMISS',style: TextStyle(color: Color(0xff624ba0),fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text('No any bookmarks yet...',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 16),),
                                Spacer(),
                              ],
                            ):Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: Color(0xfff5f0f8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, icon: Icon(CupertinoIcons.multiply,color: Color(0xff624ba0),)),
                                      Text('DISMISS',style: TextStyle(color: Color(0xff624ba0),fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Obx(
                                    () =>  ListView.builder(itemBuilder: (context, index) => Obx(
                                      () =>  ListTile(
                                        onTap: () {
                                          webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(SearchController.urlData.value[index])));
                                          Navigator.pop(context);
                                        },
                                        title: Text(SearchController.searchData.value[index]),
                                        subtitle: Text(SearchController.urlData.value[index]),
                                        trailing: IconButton(onPressed: () {
                                          SearchController.searchData.removeAt(index);
                                          SearchController.urlData.removeAt(index);
                                          RxList<String> listOfSearch=<String>[].obs;
                                          RxList<String> listOfUrl=<String>[].obs;
                                          listOfSearch.addAll(SearchController.searchData);
                                          listOfUrl.addAll(SearchController.urlData);

                                          SearchController.searchData.clear();
                                          SearchController.urlData.clear();

                                         for(int i=0;i<listOfSearch.length;i++)
                                           {
                                             SearchController.setData(listOfSearch[i], listOfUrl[i]);
                                           }

                                        }, icon: Icon(CupertinoIcons.multiply)),
                                      ),
                                    ),itemCount: SearchController.urlData.length,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },);
                  },
                  child: ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text('All Bookmarks'),
                ),),
                PopupMenuItem(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text('Search Engine'),
                          content: Obx(
                                () =>
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RadioListTile(
                                      value: 'google',
                                      groupValue: SearchController.search.value,
                                      title: Text('Google'),
                                      onChanged: (value) {
                                        SearchController.search.value =
                                            value.toString();
                                        webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri('https://www.${SearchController.search.value}.com/')));
                                        Timer(Duration(
                                          seconds: 1,
                                        ), () {
                                          Navigator.pop(context, value);
                                        },);
                                      },),
                                    RadioListTile(
                                      value: 'yahoo',
                                      groupValue: SearchController.search.value,
                                      title: Text('Yahoo'),
                                      onChanged: (value) {
                                        SearchController.search.value =
                                            value.toString();
                                        webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri('https://www.${SearchController.search.value}.com/')));
                                        Timer(Duration(
                                          seconds: 1,
                                        ), () {
                                          Navigator.pop(context, value);
                                        },);
                                      },),
                                    RadioListTile(
                                      value: 'bing',
                                      groupValue: SearchController.search.value,
                                      title: Text('Bing'),
                                      onChanged: (value) {
                                        SearchController.search.value =
                                            value.toString();
                                        webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri('https://www.${SearchController.search.value}.com/')));
                                        Timer(Duration(
                                          seconds: 1,
                                        ), () {
                                          Navigator.pop(context, value);
                                        },);
                                      },),
                                    RadioListTile(value: 'duckduckgo',
                                      groupValue: SearchController.search.value,
                                      title: Text('Duck Duck Go'),
                                      onChanged: (value) {
                                        SearchController.search.value =
                                            value.toString();
                                        webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri('https://www.${SearchController.search.value}.com/')));
                                        Timer(Duration(
                                          seconds: 1,
                                        ), () {
                                          Navigator.pop(context, value);
                                        },);
                                      },),
                                  ],),
                          ),
                        );
                      },);
                    }, child: ListTile(
                  leading: Icon(Icons.screen_search_desktop_outlined),
                  title: Text('Search Engine'),
                )),
              ];
            },),
        ],
      ),
      body: Stack(
         children: [
           Obx(
                 () =>
                 InAppWebView(
                   initialUrlRequest: URLRequest(
                       url: WebUri('https://www.${SearchController.search.value}.com/')),
                   onWebViewCreated: (controller) {
                     webViewController = controller;
                   },
                   onLoadStart: (controller, url) {
                     SearchController.load.value=true;
                   },
                   onLoadStop: (controller, url) {
                     SearchController.load.value=false;
                   },
                   shouldOverrideUrlLoading: (controller, navigationAction) async {
                     var url = navigationAction.request.url.toString();
                     Uri uri=Uri.parse(url);
                     if(SearchController.search.value=='google')
                       {
                         data=uri.queryParameters['q'];
                       }else if(SearchController.search.value=='bing')
                         {
                           data=uri.queryParameters['q'];
                         }else if(SearchController.search.value=='yahoo')
                     {
                       data=uri.queryParameters['p'];
                     }
                     return NavigationActionPolicy.ALLOW;
                   },
                 ),
           ),
           Obx(
             () =>  Column(
               children: [
                 Spacer(),
                 Container(
                   color: Colors.white,
                   child: TextFormField(
                     controller: txtSearch,
                     onFieldSubmitted: (value) {
                       SearchController.setData(value,'https://www.${SearchController.search.value}.com/search?q=${value}');
                       webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri('https://www.${SearchController.search.value}.com/search?q=${value}')));
                     },
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.grey,width: 2)
                       ),
                       focusedBorder:  OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey,width: 3)
                       ),
                       hintText: 'Search or type web address',
                       suffixIcon: Icon(Icons.search),
                     ),
                   ).marginSymmetric(vertical: 10,horizontal: 10),
                 ),
                 (SearchController.load.value==true)?LinearProgressIndicator():SizedBox(height: 0,),
               ],
             ),
           ),
         ],
      ),
      bottomNavigationBar:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {
            String url='https://www.${SearchController.search.value}.com/';
           webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
          }, icon: Icon(Icons.home)),
          IconButton(onPressed: () {
            if(data!=null)
            {
              SearchController.setData(data!, 'https://www.${SearchController.search.value}.com/search?q=$data');
            }
          }, icon: Icon(Icons.bookmark_add_outlined)),
          IconButton(onPressed: () {
            webViewController!.goBack();
          }, icon: Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: () {
            webViewController!.reload();
          }, icon: Icon(Icons.refresh)),
          IconButton(onPressed: () {
            webViewController!.goForward();
          }, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ).marginOnly(bottom: 10),
    );
  }
}
InAppWebViewController? webViewController;
var txtSearch=TextEditingController();
String? data;

