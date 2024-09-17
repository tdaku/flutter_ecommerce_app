// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/auth_remote_datasources.dart';

import '../../../../data/models/request/register_request_model.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDataSource authRemoteDataSource;
  RegisterBloc(
    this.authRemoteDataSource,
  ) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDataSource.register(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (data) => emit(const _Loaded()),
      );
    });
  }
}
