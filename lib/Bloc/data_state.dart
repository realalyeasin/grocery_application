import 'package:flutter/cupertino.dart';

@immutable
abstract class DataState {}

class DataInitialState extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final api;
  DataLoadedState({required this.api});
}

class DataErrorState extends DataState {}
