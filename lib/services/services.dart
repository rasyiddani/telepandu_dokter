import 'dart:convert';

import 'package:telemedicine_doctor/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_doctor/providers/providers.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

part 'auth_services.dart';
part 'consult_services.dart';
part 'list_patient.dart';
part 'messages_services.dart';
part 'chat_service.dart';

String baseUrl = 'http://telepandu.id/api/';