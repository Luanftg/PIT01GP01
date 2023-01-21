import 'package:finances_group/src/data/repositories/firebase_auth_repository.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

late MockFirebaseAuth fireBaseAuthMock;
late FirebaseAuthRepository firebaseAuthRepository;

final user = MockUser(
  isAnonymous: false,
  uid: 'someuid',
  email: 'luan@email.com',
  displayName: 'Luan Fonseca',
);
final LoginModel loginModel =
    LoginModel(email: user.email!, password: '123456');
final LoginModel wrongEmail =
    LoginModel(email: 'luanfonseca@email.com', password: '123456');
final LoginModel wrongPass =
    LoginModel(email: 'luan@email.com', password: '123456');
final RegisterModel registerModel = RegisterModel(
    name: 'Luan Fonseca', email: 'luanfonseca@email.com', password: '123456');

void main() {
  setUp(() {
    fireBaseAuthMock = MockFirebaseAuth();
    firebaseAuthRepository = FirebaseAuthRepository(fireBaseAuthMock);
  });
  group('[Method]: Future<UserModel?> login(LoginModel loginModel)', () {
    test('should return a [UserModel] from firebase', () async {
      final result = await firebaseAuthRepository.login(loginModel);
      fireBaseAuthMock.mockUser = user;
      expect(result, isA<UserModel>());
      expect(result?.email, 'luan@email.com');
      expect(result?.isLogged, true);
    });
    test(
        'should return a [AuthException] when catch FirebaseAuthException with code [user-not-found] from firebase',
        () async {
      whenCalling(Invocation.method(
        #signInWithEmailAndPassword,
        null,
      ))
          .on(fireBaseAuthMock)
          .thenThrow(FirebaseAuthException(code: 'user-not-found'));

      // whenCalling(Invocation.method(
      //   #signInWithEmailAndPassword,
      //   null,
      // ))
      //     .on(fireBaseAuthMock)
      //     .thenThrow(AuthException('Email não encontrado. Cadastre-se.'));

      await firebaseAuthRepository.register(registerModel);
      await firebaseAuthRepository.login(wrongEmail);

      //   expect(
      //     () async => await fireBaseAuthMock.signInWithEmailAndPassword(
      //       email: 'luan@email.com',
      //       password: '123456',
      //     ),
      //     throwsA(isA<FirebaseAuthException>()),
      //   );
      // });

      expect(
        () async => await firebaseAuthRepository.login(wrongEmail),
        throwsA(isA<AuthException>()),
      );
    });

    // test(
    //     'should return a [AuthException] when catch FirebaseAuthException with code [email-already-in-use] from firebase',
    //     () {});
  });

  group('[Method]: void register(UserModel userModel)', () {
    test('should register a single [UserModel] on firebase', () async {
      await firebaseAuthRepository.register(registerModel);
      final result = await firebaseAuthRepository.login(loginModel);
      expect(result?.name, 'Luan Fonseca');
    });
  });

  group('[Method]: bool isUserLoged()', () {
    test(
        '[FirebaseAuth.instance.currentUser] should return a [true] from firebase',
        () async {
      await firebaseAuthRepository.login(loginModel);
      final result = firebaseAuthRepository.isUserLogged();
      expect(result, true);
    });
    test(
        '[FirebaseAuth.instance.currentUser] should return a [false] from firebase',
        () async {
      final result = firebaseAuthRepository.isUserLogged();
      expect(result, false);
    });
  });

  group('[Method]: logout()', () {
    test('[FirebaseAuth.instance.currentUser] should return null', () async {
      await firebaseAuthRepository.login(loginModel);
      await firebaseAuthRepository.logout();
      final result = fireBaseAuthMock.currentUser;
      expect(result, null);
    });
  });

  group('[Method]: UserModel? isAuthenticated()', () {
    test(
        'should return [UserModel] if already authenticated on firebase(login)',
        () async {
      await firebaseAuthRepository.register(registerModel);
      await firebaseAuthRepository.login(loginModel);
      final result = firebaseAuthRepository.isAuthenticated();
      expect(result, isA<UserModel>());
    });
    test('should return [null] if user is not authenticated on firebase(login)',
        () async {
      final result = firebaseAuthRepository.isAuthenticated();
      expect(result, isNull);
    });
  });
}
