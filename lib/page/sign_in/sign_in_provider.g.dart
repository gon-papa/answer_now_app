// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInHash() => r'28b5cdbb7821bff075172a93c02f0ebcb2de6b28';

/// See also [signIn].
@ProviderFor(signIn)
final signInProvider = AutoDisposeFutureProvider<Result>.internal(
  signIn,
  name: r'signInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInRef = AutoDisposeFutureProviderRef<Result>;
String _$signInFormKeyHash() => r'4db56a757f3573dadac76a25b2389a8be26c4dc9';

/// See also [signInFormKey].
@ProviderFor(signInFormKey)
final signInFormKeyProvider = Provider<GlobalKey<FormState>>.internal(
  signInFormKey,
  name: r'signInFormKeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInFormKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInFormKeyRef = ProviderRef<GlobalKey<FormState>>;
String _$emailHash() => r'7b5bd1387e3d731709c68b8eb59d34c69ad8bbe4';

/// See also [Email].
@ProviderFor(Email)
final emailProvider = AutoDisposeNotifierProvider<Email, String?>.internal(
  Email.new,
  name: r'emailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$emailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Email = AutoDisposeNotifier<String?>;
String _$passwordHash() => r'b46c7abaac384df41f5fc331833b22a9a6eb7ee1';

/// See also [Password].
@ProviderFor(Password)
final passwordProvider =
    AutoDisposeNotifierProvider<Password, String?>.internal(
  Password.new,
  name: r'passwordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$passwordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Password = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
