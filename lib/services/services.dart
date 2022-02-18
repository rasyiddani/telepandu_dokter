import 'dart:convert';

import 'package:telemedicine_doctor/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'auth_services.dart';

String baseUrl = 'http://telemedicine-test.akunku.co/api/';