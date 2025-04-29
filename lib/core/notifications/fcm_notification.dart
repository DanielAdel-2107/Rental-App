// import 'dart:developer';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:smart_connect/core/helper/show_custom_dialog.dart';

// class NotificationsHelper {
//   // creat instance of fbm
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   // initialize notifications for this app or device
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     // ignore: unused_local_variable
//     String? deviceToken = await _firebaseMessaging.getToken();
//   }

//   // handel notifications in case app is opened
//   void setupFirebaseMessaging() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (message.notification != null) {
//         showCustomDialog(
//             title: message.notification!.title!,
//             description: message.notification!.body!,
//             dialogType: DialogType.info);
//       }
//     });
//   }

//   // get access token for API calls

//   Future<String?> getAccessToken() async {
//     final serviceAccountJson = {
//       "type": "service_account",
//       "project_id": "smart-connect-2ccaa",
//       "private_key_id": "e58e371754734b72ecd188311d87e12f2cf83f51",
//       "private_key":
//           "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQD43rZa4kYpEn31\njF4FfwZwv7ofI6T9aFT8dO1YNzaMo6+wrqr5LiEVWyuL09q4wljkT4otOh3/pCXH\n2JS2iHnCAjlQwIZoFhBcBHchstQpnQMJGulKdR73qQzBX+uf9Zldnypy1RToBclU\nFGePCfYpSsBmFKlr2gSMRpZYsyEKpL2eF8ztcJU2GllqG7kIr4XQ3sjWbmfXaMMa\nGCpqL7+zSj6rFnUKB+f5hzlhQDmtS2taHH1GxYzgqhjbdphwbp2MzKsS81mwzi6S\n/uEpQ8I0ymnRim3FmY19ferhSdEjahsVy9UsDKDp3GEYd9pFaWD7/7Pz8iesC+I5\nSB3QFBQlAgMBAAECggEAGnPhwitG9dqnVNBEtiTYVGesqt6pDN5oGiV7jOLhg3Vq\nmUcXmUDT92cna8dq+jR+KlZiA4in46JY+bMFq5k6B+sgmHq+TpX5yy4WU5ikgH/V\n8MPRhD6KuhxX5L4DV49Na+wdIPORM1BaI/u/Pi764Uy2wqLzlyknTpm6JVd07aJ7\nc+83yj0CeY2UhhdrGA8/5ODRMHgCWlhurC+OpKgeDX6uEOlgBJyyQVU186amXGsJ\nR5ZyK2e6nWtqPxg4jFLtDkxidicFW9/OUayjC2ViS1JAH0tb9uNG/lLvEbfw8wSx\nEwzP4zJcOiuew3tsPkohhooSS5wgC871YIs9JwXpSQKBgQD+225eOMuLIQnwtqoL\nEcl+m7gc5qQGSVpekP9ASivjLhFPGZvFnD8qj/m12NPPxNGfKHtg2Ku6SYEriyYk\nAJxZC/uJvT7nZ99Z3Q+HnRWrU9orU7ZIhE/QDjlwr2/BS62ihGXO4jr6WhVU444J\n543yLRgLkTeSrlLDiqfCyPmSEwKBgQD5/Gh3/JJYHlKz+hRdWrLfu8bTSQyAMPn+\n758FdYp8sNq5omedWS2MwRxZrgiG5rvilqDTcz/lEfoer9jPaNuyyA8QCuaqL3WM\njYxkf3LliMrHleHX/2L0bVvyMi6iu9HIUyX4w5le9Al1DOwtD34YRjXB5t26QgqD\nnaASnupH5wKBgEPD8PrYuzaJWG1LBLfgyOUDXtdAdIi/ZGoUv+pGTpkfnLadpo/K\n1fjpQ4qY1uk9+kcJqpS7yB3GgbQkUcXs66W5y+56BYneUsNARmrW1/YwW6h9n9B0\nbgxyW8+ctmh9SPQXpEJ4YRpEbbuerhvwGAw29VfOCyrTc2pPKgBfFA1FAoGAGEVs\nczHfl5SiHP1L2uCCe3yEymDOSOf4bcsgGmyWHJMjOWDORJWy+XaKZR6jj015sn9D\ncCRBcOE08qPKHiElK4+G/tzAFofzFslrdxp0slp8rbIcslcGaYrwoWxD4OLxdEy2\nZBfBnVl+TZIKoDlf2cV/VKswnfPph2vXbddmEcMCgYBS5TVrCfALvx3nEHRLMWdo\nNDtoastv0qOgrzfSgHfVGlJQsA2lKAWeKO4GQO7wRCgdT85tylTNkjRNTBg+bWqj\n/e07zNT25Sk4Vj6P3UmY/D1CzlOUu7BxSAsej8O3d8mJKgRV3QFw4bgysoZWb/Ql\nYmAhirr9TLiWD0TXkLrjFg==\n-----END PRIVATE KEY-----\n",
//       "client_email":
//           "firebase-adminsdk-fbsvc@smart-connect-2ccaa.iam.gserviceaccount.com",
//       "client_id": "117080790161859036058",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url":
//           "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url":
//           "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40smart-connect-2ccaa.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     };
//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];

//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);
//       auth.AccessCredentials credentials =
//           await auth.obtainAccessCredentialsViaServiceAccount(
//               auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//               scopes,
//               client);
//       client.close();
//       return credentials.accessToken.data;
//     } catch (e) {
//       print("----------------------------------------------");
//       print("Error getting access token: $e");
//       print("----------------------------------------------");
//       return null;
//     }
//   }

//   // get body for sending notification to specific user
//   Map<String, dynamic> getBody({
//     required String topic,
//     required String title,
//     required String body,
//     required String userId,
//     String? type,
//   }) {
//     return {
//       "message": {
//         "topic": topic,
//         "notification": {"title": title, "body": body},
//         "android": {
//           "notification": {
//             "notification_priority": "PRIORITY_MAX",
//             "sound": "default"
//           }
//         },
//         "apns": {
//           "payload": {
//             "aps": {"content_available": true}
//           }
//         },
//         "data": {
//           "type": type ?? "message",
//           "id": userId,
//           "click_action": "FLUTTER_NOTIFICATION_CLICK"
//         }
//       }
//     };
//   }

//   // send notifications to a specific user
//   Future<void> sendNotifications({
//     required String topic,
//     required String title,
//     required String body,
//     required String userId,
//     String? type,
//   }) async {
//     try {
//       var serverKeyAuthorization = await getAccessToken();
//       const String urlEndPoint =
//           "https://fcm.googleapis.com/v1/projects/smart-connect-2ccaa/messages:send";
//       Dio dio = Dio();
//       dio.options.headers['Content-Type'] = 'application/json';
//       dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';
//       var response = await dio.post(
//         urlEndPoint,
//         data: getBody(
//           userId: userId,
//           topic: topic,
//           title: title,
//           body: body,
//           type: type ?? "message",
//         ),
//       );
//       print('Response Status Code: ${response.statusCode}');
//       print('Response Data: ${response.data}');
//     } catch (e) {
//       print("Error sending notification: $e");
//     }
//   }

//   // subscribe to a topic
//   Future<void> subscribeToTopic({required String topic}) async {
//     log('Subscribed to $topic');
//     await _firebaseMessaging.requestPermission();

//     await _firebaseMessaging.subscribeToTopic(topic);
//   }

//   // unSubscribe to a topic
//   Future<void> unSubscribeToTopic({required String topic}) async {
//     await _firebaseMessaging.unsubscribeFromTopic(topic);
//   }
// }
