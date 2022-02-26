import 'dart:convert';

import 'package:telemedicine_doctor/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_doctor/providers/providers.dart';
import 'package:http/http.dart' as http;

part 'auth_services.dart';
part 'list_patient.dart';

String baseUrl = 'http://telepandu.id/api/';