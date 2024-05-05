import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/features/authentication/domain/entities/register_request.dart';
import 'package:nyt/features/authentication/domain/entities/register_response.dart';




abstract class BaseAuthenticationRepository {
  Future<Either<Failure, RegisterResponse>> login(RegisterRequest request);
}