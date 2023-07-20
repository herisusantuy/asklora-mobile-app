
// states
abstract class ToggleState {
  final bool showPriceDifference;

  ToggleState(this.showPriceDifference);
}

class ShowPriceDifferenceState extends ToggleState {
  ShowPriceDifferenceState(bool showPriceDifference) : super(showPriceDifference);
}
