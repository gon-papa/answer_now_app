import 'package:answer_now_app/importer.dart';
import 'package:intl/date_symbol_data_local.dart';

String dataTimeFormatJp(DateTime dateTime) {
  initializeDateFormatting('ja');
  return DateFormat.yMMMMd('ja').add_Hm().format(dateTime);
}
