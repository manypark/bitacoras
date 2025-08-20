import 'package:intl/intl.dart';
import 'package:bitacoras/core/utils/constants/string_extension.dart';

String formatDate(DateTime date) => '${DateFormat.d('es').format(date)}/${DateFormat.MMM('es').format(date)}/${DateFormat.y('es').format(date)}';

String formatDayNameAndDate(DateTime date) => '${DateFormat('EEEE', 'es').format(date)} ${DateFormat.d('es').format(date)}/${DateFormat.MMM('es').format(date)}/${DateFormat.y('es').format(date)}';

String formatDateDayNameMonth(DateTime date) => '${DateFormat('EEEE', 'es').format(date)} ${DateFormat.d('es').format(date)} de ${DateFormat.MMMM('es').format(date)}';

String formatDateDayMonthAndYear(DateTime date) => '${DateFormat.d('es').format(date)} de ${DateFormat.MMMM('es').format(date)} ${DateFormat.y('es').format(date)}';

String formatDateDayAndMonth(DateTime date) => '${DateFormat.d('es').format(date)} de ${DateFormat.MMMM('es').format(date)}';

String formatDayMonthHour(DateTime date) => '${DateFormat.d('es').format(date)} ${DateFormat.MMMM('es').format(date)}, ${DateFormat.Hm('es').format(date) }';

String formatDateMonthAndYear(DateTime date) => '${DateFormat.MMMM('es').format(date)} ${DateFormat.y('es').format(date)}'.toCapitalizeFirstLetter();

String dateTimeParse({required DateTime date}) => DateFormat("dd/MM/yyyy HH:mm:ss", "es-MX").format(date).toString();

String formatOrderDetailDates(DateTime date) => '${DateFormat.EEEE('es').format(date).toCapitalizeFirstLetter()}\n ${DateFormat('dd').format(date)}/${DateFormat.MMM('es').format(date).toCapitalizeFirstLetter()}/${DateFormat('yyyy').format(date)}';

String dateParse({required DateTime date}) {
  String newString = DateFormat("EEE d MMMM", "es-MX").format(date).toCapitalizeFirstLetter();

  List<String> term = newString.split(" ");

  return [term[0], term[1], term[2].toCapitalizeFirstLetter()].join(" ");
}
