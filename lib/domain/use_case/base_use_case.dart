import 'package:dartz/dartz.dart';
import 'package:mvvm/data/network/failure.dart';

abstract class BaseUseCase<IN, OUT> {
  Future<Either<Failure, OUT>>execute(IN input);
}