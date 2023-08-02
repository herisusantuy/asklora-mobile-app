import 'conversation.dart';

enum ComponentType {
  promptButton('prompt_btn'),
  navigationButton('nav_btn');

  final String value;

  const ComponentType(this.value);

  static ComponentType findByString(String aiComponentTypeString) =>
      ComponentType.values
          .firstWhere((element) => element.value == aiComponentTypeString);
}

abstract class Component extends Conversation {
  final String id;
  final String label;

  Component(this.id, this.label);

  ComponentType componentType();

  static empty() => const [];

  @override
  ConversationType type() => ConversationType.component;

  @override
  List<Object?> get props => [type()];
}

class PromptButton extends Component {
  PromptButton(String id, String label) : super(id, label);

  @override
  ComponentType componentType() => ComponentType.promptButton;

  @override
  List<Object?> get props => [componentType()];
}

class NavigationButton extends Component {
  NavigationButton(String id, String label, this.route) : super(id, label);

  final String route;

  @override
  ComponentType componentType() => ComponentType.navigationButton;

  @override
  List<Object?> get props => [componentType()];
}
