import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:nyt/features/authentication/domain/entities/register_request.dart';
import 'package:nyt/features/authentication/domain/entities/register_response.dart';
import 'package:nyt/features/authentication/domain/repositories/base_authentication_repository.dart';



class AuthenticationRepository extends BaseAuthenticationRepository {
  final BaseAuthenticationDataSource authenticationDataSource;

  AuthenticationRepository({required this.authenticationDataSource});

  @override
  Future<Either<Failure, RegisterResponse>> login(RegisterRequest request) async {
    return await authenticationDataSource.register(request);
  }
}