// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatDetailHash() => r'bf150df77c55c3e7b24e3c4dc69fd9cb1ceae0de';

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

abstract class _$ChatDetail
    extends BuildlessAutoDisposeNotifier<List<ChatShowResponseItem?>> {
  late final String uuid;

  List<ChatShowResponseItem?> build(
    String uuid,
  );
}

/// See also [ChatDetail].
@ProviderFor(ChatDetail)
const chatDetailProvider = ChatDetailFamily();

/// See also [ChatDetail].
class ChatDetailFamily extends Family<List<ChatShowResponseItem?>> {
  /// See also [ChatDetail].
  const ChatDetailFamily();

  /// See also [ChatDetail].
  ChatDetailProvider call(
    String uuid,
  ) {
    return ChatDetailProvider(
      uuid,
    );
  }

  @override
  ChatDetailProvider getProviderOverride(
    covariant ChatDetailProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatDetailProvider';
}

/// See also [ChatDetail].
class ChatDetailProvider extends AutoDisposeNotifierProviderImpl<ChatDetail,
    List<ChatShowResponseItem?>> {
  /// See also [ChatDetail].
  ChatDetailProvider(
    String uuid,
  ) : this._internal(
          () => ChatDetail()..uuid = uuid,
          from: chatDetailProvider,
          name: r'chatDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatDetailHash,
          dependencies: ChatDetailFamily._dependencies,
          allTransitiveDependencies:
              ChatDetailFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  ChatDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  List<ChatShowResponseItem?> runNotifierBuild(
    covariant ChatDetail notifier,
  ) {
    return notifier.build(
      uuid,
    );
  }

  @override
  Override overrideWith(ChatDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatDetailProvider._internal(
        () => create()..uuid = uuid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ChatDetail, List<ChatShowResponseItem?>>
      createElement() {
    return _ChatDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatDetailProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatDetailRef
    on AutoDisposeNotifierProviderRef<List<ChatShowResponseItem?>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _ChatDetailProviderElement extends AutoDisposeNotifierProviderElement<
    ChatDetail, List<ChatShowResponseItem?>> with ChatDetailRef {
  _ChatDetailProviderElement(super.provider);

  @override
  String get uuid => (origin as ChatDetailProvider).uuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
