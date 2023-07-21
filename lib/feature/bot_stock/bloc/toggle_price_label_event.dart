part of 'toggle_price_label_bloc.dart';

// events
abstract class ToggleEvent {}

class TogglePriceDifferenceEvent extends ToggleEvent {
  final bool? showPriceDifference;

  TogglePriceDifferenceEvent({this.showPriceDifference});
}
