// ignore_for_file: library_prefixes

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_doctor/components/components.dart';
import 'package:telemedicine_doctor/providers/providers.dart';
import 'package:telemedicine_doctor/services/services.dart';
import 'package:telemedicine_doctor/utils/utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:telemedicine_doctor/models/models.dart';
import 'package:http/http.dart' as http;

part 'splash_screen.dart';
part './auth/forgot_password.dart';
part './auth/login.dart';
part './auth/new_password.dart';
part './dashboard/dashboard.dart';
part './dashboard/notification.dart';
part './users/jadwal_profile.dart';
part './users/pesan_cepat.dart';
part './users/profile_menu.dart';
part './users/tambah_pesan_cepat.dart';
part './users/user_profile.dart';
part './consultation/list_patient.dart';
part './consultation/list_month.dart';
part './consultation/chat_page.dart';
part './consultation/follow_up.dart';
part './consultation/loading_success.dart';
