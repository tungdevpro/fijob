import 'package:dartz/dartz.dart';

Either<L, R> success<L, R>(R r) => right(r);

Either<L, R> failure<L, R>(L l) => left(l);
