// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:neomobilestore/datalist.dart';
// import 'package:neomobilestore/http.dart';
// import 'package:parse_server_sdk/parse_server_sdk.dart';
// import 'package:weather/weather.dart';
//
// class detail extends StatefulWidget {
//   final String vid;
//   detail(this.vid);
//   @override
//   _detail createState() => _detail(this.vid);
// }
// class _detail extends State<detail> {
//   final String vid;
//   _detail(this.vid);
//   List<cardsdetail> detail = [];
//   List<Menu> menu = [];
//   bool loading = false;
//   bool havemenu = false;
//   String photo = '';
//   WeatherFactory weather = WeatherFactory('44eee383bcef13cc60deaa9113cdc160');
//   var celsius;
//   QueryBuilder<ParseObject> memberParse = QueryBuilder<ParseObject>(ParseObject('Vender'));
//   QueryBuilder<ParseObject> menuParse = QueryBuilder<ParseObject>(ParseObject('Menu'));
//   void initState(){
//     carddetail(vid);
//     getMenu(vid);
//   }
//   void getMenu(objectId) async{
//     menuParse.whereEqualTo('M_ID', objectId);
//     final ParseResponse apiResponse = await menuParse.query();
//     if(apiResponse.result.toString() =='null'){
//
//     }else{
//       log(apiResponse.result.toString());
//       jsonmenu(apiResponse.result.toString());
//     }
//   }
//   void carddetail(objectId) async{
//     memberParse.whereEqualTo('objectId', objectId);
//     final ParseResponse apiResponse = await memberParse.query();
//     if(apiResponse.result.toString() =='null'){
//
//     }else{
//       json(apiResponse.result.toString());
//       log(apiResponse.result.toString());
//     }
//
//   }
//   void json(String string) async{
//     var tagsjson = jsonDecode(string) as List;
//     detail = tagsjson.map((data) => cardsdetail.fromJson(data)).toList();
//     if(detail.isNotEmpty){
//       double lng = double.parse(detail[0].lng);
//       double lat = double.parse(detail[0].lat);
//       Weather w = await weather.currentWeatherByLocation(lng,lat);
//       setState(() {
//         photo = detail[0].photo.split(':')[3]+':'+detail[0].photo.split(':')[4];
//         photo = photo.replaceAll('}', '');
//         loading = true;
//         celsius = w.temperature!.celsius;
//       });
//     }
//   }
//   void jsonmenu(String string){
//     var tagsjson = jsonDecode(string) as List;
//     menu = tagsjson.map((data) => Menu.fromJson(data)).toList();
//     if(menu.isNotEmpty){
//       setState(() {
//         havemenu = true;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return loading ?Expanded(
//       child: Column(
//         children: [
//           Expanded(
//               flex: 4,
//               child:Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.network(
//                         photo.trim(),
//                       )
//                   ),
//                 )
//               )
//           ),
//           Expanded(
//             flex: 2,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('一'),
//                       Checkbox(
//                         value: detail[0].weektime1 == '1'? true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('二'),
//                       Checkbox(
//                         value: detail[0].weektime2 == '1'?true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('三'),
//                       Checkbox(
//                         value: detail[0].weektime3 == '1'?true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('四'),
//                       Checkbox(
//                         value: detail[0].weektime4 == '1'?true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('五'),
//                       Checkbox(
//                         value: detail[0].weektime5 == '1'?true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('六'),
//                       Checkbox(
//                         value: detail[0].weektime6 == '1'?true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('日'),
//                       Checkbox(
//                         value: detail[0].weektime7 == '1'?true:false,
//                         activeColor: Colors.green,
//                         onChanged: (value){
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child:Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: havemenu ? Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: ListView.builder(
//                       itemCount: menu.length,
//                       itemBuilder: (context,i){
//                         final list = menu[i];
//                         return Menulist(list.name,list.price);
//                       }
//                     ),
//                   ):Center(
//                     child: Text('暫無提供菜單'),
//                   )
//                 ),
//                 Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('店家地址:',
//                           style: TextStyle(
//                             fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(detail[0].place,
//                           style: TextStyle(
//                               fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('聯絡電話:',
//                           style: TextStyle(
//                               fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(detail[0].phone,
//                           style: TextStyle(
//                             fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('營業時間:',
//                           style: TextStyle(
//                               fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(detail[0].daytime,
//                           style: TextStyle(
//                               fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('地區溫度:',
//                           style: TextStyle(
//                               fontSize: 16
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(celsius.toStringAsFixed(1) + '°C',
//                           style: TextStyle(
//                               fontSize: 16
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               ],
//             )
//           ),
//         ],
//       )
//     ):Expanded(child: Container(
//       child: Center(
//         child: CircularProgressIndicator(
//           backgroundColor: Colors.grey[200],
//           valueColor: AlwaysStoppedAnimation(Colors.green[500]),
//         ),
//       ),
//     ));
//   }
//   Widget Menulist(name ,price){
//     return Column(
//       children: [
//         SizedBox(
//           height: 10,
//         ),
//         Row(
//           children: [
//             Text(
//               '   *',
//             ),
//             Expanded(
//               flex: 3,
//               child: Text(
//                 name,
//                 style: TextStyle(
//                   fontSize: 16
//                 ),
//               )
//             ),
//             Expanded(
//               flex: 2,
//               child: Text(
//                 price,
//                 style: TextStyle(
//                   fontSize: 16
//                 ),
//               )
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Divider(
//           height: 1,
//           indent: 10,
//           endIndent: 20,
//           color: Colors.grey[900],
//         ),
//       ],
//     );
//   }
// }
