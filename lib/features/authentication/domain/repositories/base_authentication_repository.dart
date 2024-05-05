import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/features/authentication/domain/entities/login_request.dart';
import 'package:nyt/features/authentication/domain/entities/login_response.dart';




abstract class BaseAuthenticationRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
}