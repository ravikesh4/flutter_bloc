part of 'couter_cubit.dart';

// @immutable
// abstract class CouterState {}

class CounterState {
  int counterValue;
  bool wasIncremented;
  
  CounterState({
    @required this.counterValue,
    this.wasIncremented,
  });

}
