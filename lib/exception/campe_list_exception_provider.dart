import 'package:campe_app/exception/custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final campeListExceptionProvider = StateProvider<CustomException?>((_) => null);