// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeScrollHash() => r'1e96daafc9f425001c29e574530803ccee820ce8';

/// See also [homeScroll].
@ProviderFor(homeScroll)
final homeScrollProvider = AutoDisposeProvider<ScrollController>.internal(
  homeScroll,
  name: r'homeScrollProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeScrollHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeScrollRef = AutoDisposeProviderRef<ScrollController>;
String _$keywordHash() => r'56bcbd531f865980bba9014e653d5e40f0fd77c2';

/// See also [Keyword].
@ProviderFor(Keyword)
final keywordProvider = AutoDisposeNotifierProvider<Keyword, String?>.internal(
  Keyword.new,
  name: r'keywordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$keywordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Keyword = AutoDisposeNotifier<String?>;
String _$chatsHash() => r'd5f58e066ae783f41d19b27d991d1dd87d091985';

/// See also [Chats].
@ProviderFor(Chats)
final chatsProvider =
    NotifierProvider<Chats, List<ChatIndexResponseItem?>>.internal(
  Chats.new,
  name: r'chatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Chats = Notifier<List<ChatIndexResponseItem?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
