import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class SelectLanEvent extends LanguageEvent {
  final lan;
  final lanCode;

  SelectLanEvent(this.lanCode, this.lan);

  @override
  List<Object> get props => [lan, lanCode];
}
