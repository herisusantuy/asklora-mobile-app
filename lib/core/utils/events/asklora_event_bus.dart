import 'package:event_bus/event_bus.dart';

class AskLoraEventBus {
  static final AskLoraEventBus _askLoraEventBus = AskLoraEventBus._internal();

  factory AskLoraEventBus() {
    return _askLoraEventBus;
  }

  AskLoraEventBus._internal();

  final EventBus event = EventBus();
}
