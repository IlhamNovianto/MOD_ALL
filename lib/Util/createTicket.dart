import 'dart:math';

import 'package:intl/intl.dart';

Future<String> createTicketMod({String? userId}) async {
  Random random = Random();
  DateTime date = DateTime.now();
  String dateFormat = DateFormat('yyyy').format(date);
  int randomInt = random.nextInt(900000) + 000001;
  String modTicket = ('MOD/$userId/$dateFormat-$randomInt');
  return modTicket;
}

Future<String> createTicketBm({String? userId}) async {
  Random random = Random();
  DateTime date = DateTime.now();
  String dateFormat = DateFormat('ddyy').format(date);
  int randomInt = random.nextInt(900000) + 000001;
  String modTicket = ('BM/$userId/$dateFormat-$randomInt');
  return modTicket;
}
