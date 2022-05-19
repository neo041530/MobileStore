import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Future<String> memberLogin(String account,String password) async {
//   try {
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     String url = await  'http://192.168.0.164/mobilestore.asmx/Login?account='+account+'&password='+password;
//     //開啟http連結
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//     //等待連線伺服器（傳送請求給伺服器）
//     HttpClientResponse response = await request.close();
//
//     String string = await response.transform(utf8.decoder).join();
//     _httpClient.close();
//     return string;
//   } catch (e) {
//     return '請在試一次';
//   }
// }
// void Signup(String account,String password)async{
//   try{
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     //開啟http連結
//     String url = await 'http://192.168.0.164/mobilestore.asmx/Signup?account='+account+'&password='+password;
//
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//
//     HttpClientResponse response = await request.close();
//
//     _httpClient.close();
//   }catch(e){
//
//   }
// }
// void addFavorite(String mid,String vid)async{
//   try{
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     //開啟http連結
//     String url = await 'http://192.168.0.164/mobilestore.asmx/addFavorite?mid='+mid+'&vid='+vid;
//
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//
//     HttpClientResponse response = await request.close();
//
//     _httpClient.close();
//   }catch(e){
//
//   }
// }
// void removeFavorite(String mid,String vid)async{
//   try{
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     //開啟http連結
//     String url = await 'http://192.168.0.164/mobilestore.asmx/removeFavorite?mid='+mid+'&vid='+vid;
//
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//
//     HttpClientResponse response = await request.close();
//
//     _httpClient.close();
//   }catch(e){
//
//   }
// }
// Future<String> carddetail(String vid) async {
//   try {
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     String url = await 'http://192.168.0.164/mobilestore.asmx/carddetail?vid='+vid;
//     //開啟http連結
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//     //等待連線伺服器（傳送請求給伺服器）
//     HttpClientResponse response = await request.close();
//
//     String string = await response.transform(utf8.decoder).join();
//     _httpClient.close();
//     return string;
//   } catch (e) {
//     return '請在試一次';
//   }
// }
// Future<String> showfavorite(String mid) async {
//   try {
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     String url = await 'http://192.168.0.164/mobilestore.asmx/showFavorite?mid='+mid;
//     //開啟http連結
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//     //等待連線伺服器（傳送請求給伺服器）
//     HttpClientResponse response = await request.close();
//
//     String string = await response.transform(utf8.decoder).join();
//     _httpClient.close();
//     return string;
//   } catch (e) {
//     return '請在試一次';
//   }
// }
// Future<String> ckfavorite(String mid,String vid) async {
//   try {
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     String url = await 'http://192.168.0.164/mobilestore.asmx/ckFavorite?mid='+mid+'&vid='+vid;
//     //開啟http連結
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//     //等待連線伺服器（傳送請求給伺服器）
//     HttpClientResponse response = await request.close();
//
//     String string = await response.transform(utf8.decoder).join();
//     _httpClient.close();
//     return string;
//   } catch (e) {
//     return '請在試一次';
//   }
// }
// Future<String> getlatlng(String vid) async {
//   try {
//     HttpClient _httpClient = HttpClient();
//     //繞過憑證
//     _httpClient.badCertificateCallback =
//     await (X509Certificate cert, String host, int port) => true;
//     String url = await 'http://192.168.0.164/mobilestore.asmx/getlatlng?vid='+vid;
//     //開啟http連結
//     HttpClientRequest request = await _httpClient.getUrl(Uri.parse(url));
//     //等待連線伺服器（傳送請求給伺服器）
//     HttpClientResponse response = await request.close();
//
//     String string = await response.transform(utf8.decoder).join();
//     _httpClient.close();
//     return string;
//   } catch (e) {
//     return '請在試一次';
//   }
// }