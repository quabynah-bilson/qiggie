import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseLocalStorageRepository)
class QiggyLocalStorageRepository extends BaseLocalStorageRepository {
  final FlutterSecureStorage storage;
  final _kSessionKey = 'qiggy-session-key';

  QiggyLocalStorageRepository(this.storage);

  @override
  Future<Either<Session, String>> getCurrentSession() async {
    logger.d('reading session from persistent storage');
    var sessionJson = await storage.read(key: _kSessionKey);
    if (sessionJson.isNullOrEmpty()) {
      return right('No session created');
    }
    var decodedSessionJson = json.decode(sessionJson!);
    var session = Session.fromJson(decodedSessionJson);
    logger.d('session from json -> $session');
    return left(session);
  }

  @override
  Future<void> saveSession(Session session) async {
    var encodedSessionJson = json.encode(session.toProto3Json());
    logger.d('writing session to persistent storage -> $encodedSessionJson');
    await storage.write(key: _kSessionKey, value: encodedSessionJson);
  }

  @override
  Future<void> clearSession() async {
    if (await storage.containsKey(key: _kSessionKey)) {
      await storage.delete(key: _kSessionKey);
    }
  }
}
