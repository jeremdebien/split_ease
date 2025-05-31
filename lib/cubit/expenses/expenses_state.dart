import 'package:equatable/equatable.dart';
import 'package:split_ease/database/custom_models/expense_with_images.dart';

abstract class ExpensesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExpensesInitial extends ExpensesState {}

class ExpensesLoading extends ExpensesState {}

class ExpensesLoaded extends ExpensesState {
  final List<ExpenseWithImages> expensesWithImages;
  ExpensesLoaded(this.expensesWithImages);

  @override
  List<Object?> get props => [expensesWithImages];
}

class ExpensesError extends ExpensesState {
  final String message;

  ExpensesError(this.message);

  @override
  List<Object?> get props => [message];
}
