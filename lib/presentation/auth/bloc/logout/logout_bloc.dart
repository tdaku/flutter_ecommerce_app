// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/auth_remote_datasources.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSource authRemoteDataSource;
  LogoutBloc(
    this.authRemoteDataSource,
  ) : super(const _Initial()) {
    on<_Logout>((event, emit) async{
      emit(const _Loading());
      final result = await authRemoteDataSource.logout();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Loaded()),
      );
    });
  }
}
