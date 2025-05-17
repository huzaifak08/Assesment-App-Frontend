// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerUserNotifierHash() =>
    r'88e68c1bb6424d23bdb8361cd06cb805ef44f975';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [registerUserNotifier].
@ProviderFor(registerUserNotifier)
const registerUserNotifierProvider = RegisterUserNotifierFamily();

/// See also [registerUserNotifier].
class RegisterUserNotifierFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [registerUserNotifier].
  const RegisterUserNotifierFamily();

  /// See also [registerUserNotifier].
  RegisterUserNotifierProvider call(
    String fullName,
    String email,
    String password,
  ) {
    return RegisterUserNotifierProvider(fullName, email, password);
  }

  @override
  RegisterUserNotifierProvider getProviderOverride(
    covariant RegisterUserNotifierProvider provider,
  ) {
    return call(provider.fullName, provider.email, provider.password);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'registerUserNotifierProvider';
}

/// See also [registerUserNotifier].
class RegisterUserNotifierProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [registerUserNotifier].
  RegisterUserNotifierProvider(String fullName, String email, String password)
    : this._internal(
        (ref) => registerUserNotifier(
          ref as RegisterUserNotifierRef,
          fullName,
          email,
          password,
        ),
        from: registerUserNotifierProvider,
        name: r'registerUserNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$registerUserNotifierHash,
        dependencies: RegisterUserNotifierFamily._dependencies,
        allTransitiveDependencies:
            RegisterUserNotifierFamily._allTransitiveDependencies,
        fullName: fullName,
        email: email,
        password: password,
      );

  RegisterUserNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullName,
    required this.email,
    required this.password,
  }) : super.internal();

  final String fullName;
  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(RegisterUserNotifierRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterUserNotifierProvider._internal(
        (ref) => create(ref as RegisterUserNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fullName: fullName,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _RegisterUserNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterUserNotifierProvider &&
        other.fullName == fullName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RegisterUserNotifierRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `fullName` of this provider.
  String get fullName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _RegisterUserNotifierProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with RegisterUserNotifierRef {
  _RegisterUserNotifierProviderElement(super.provider);

  @override
  String get fullName => (origin as RegisterUserNotifierProvider).fullName;
  @override
  String get email => (origin as RegisterUserNotifierProvider).email;
  @override
  String get password => (origin as RegisterUserNotifierProvider).password;
}

String _$loginUserNotifierHash() => r'be651aafec2a4561ae63931211e78b3e31bcaeb6';

/// See also [loginUserNotifier].
@ProviderFor(loginUserNotifier)
const loginUserNotifierProvider = LoginUserNotifierFamily();

/// See also [loginUserNotifier].
class LoginUserNotifierFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [loginUserNotifier].
  const LoginUserNotifierFamily();

  /// See also [loginUserNotifier].
  LoginUserNotifierProvider call(String email, String password) {
    return LoginUserNotifierProvider(email, password);
  }

  @override
  LoginUserNotifierProvider getProviderOverride(
    covariant LoginUserNotifierProvider provider,
  ) {
    return call(provider.email, provider.password);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginUserNotifierProvider';
}

/// See also [loginUserNotifier].
class LoginUserNotifierProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [loginUserNotifier].
  LoginUserNotifierProvider(String email, String password)
    : this._internal(
        (ref) =>
            loginUserNotifier(ref as LoginUserNotifierRef, email, password),
        from: loginUserNotifierProvider,
        name: r'loginUserNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loginUserNotifierHash,
        dependencies: LoginUserNotifierFamily._dependencies,
        allTransitiveDependencies:
            LoginUserNotifierFamily._allTransitiveDependencies,
        email: email,
        password: password,
      );

  LoginUserNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(LoginUserNotifierRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginUserNotifierProvider._internal(
        (ref) => create(ref as LoginUserNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _LoginUserNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginUserNotifierProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoginUserNotifierRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _LoginUserNotifierProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with LoginUserNotifierRef {
  _LoginUserNotifierProviderElement(super.provider);

  @override
  String get email => (origin as LoginUserNotifierProvider).email;
  @override
  String get password => (origin as LoginUserNotifierProvider).password;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
