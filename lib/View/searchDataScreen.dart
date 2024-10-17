// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../Controller/search_engine_controller.dart';
//
// class Searchdatascreen extends StatelessWidget {
//   const Searchdatascreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller=Get.put(SearchEngine());
//     // Timer(Duration(seconds: 1), () {
//     //   Get.back();
//     // },);
//     var txtName=TextEditingController();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: txtName,
//             ),
//             ElevatedButton(onPressed: () {
//               controller.setData(txtName.text);
//              // controller.webData.clear();
//             }, child: Text('Save')),
//             FilledButton(onPressed: () {
//               controller.getData();
//               showDialog(context: context, builder: (context) => AlertDialog(
//                 title: Text('data'),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: List.generate(controller.searchData.length, (index) => GestureDetector(onTap:() {
//                     List data=[];
//                     for(int i=0;i<controller.searchData.length;i++)
//                       {
//                         if(i!=index)
//                           {
//                             data.add(controller.searchData[i]);
//                           }
//                       }
//                   },child: Text(controller.searchData[index])),),
//                 ),
//               ),);
//             }, child: Text('show')),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
