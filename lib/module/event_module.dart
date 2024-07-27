import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EventModule {
  @lazySingleton
  EventBus get eventBus => EventBus();
}

@lazySingleton
class DiaryListRefreshEvent {}