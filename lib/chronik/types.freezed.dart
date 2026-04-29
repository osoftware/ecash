// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TokenInfo {

 String get tokenId; TokenType get tokenType; GenesisInfo get genesisInfo; BlockMetadata? get block; int get timeFirstSeen;
/// Create a copy of TokenInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenInfoCopyWith<TokenInfo> get copyWith => _$TokenInfoCopyWithImpl<TokenInfo>(this as TokenInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenInfo&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.genesisInfo, genesisInfo) || other.genesisInfo == genesisInfo)&&(identical(other.block, block) || other.block == block)&&(identical(other.timeFirstSeen, timeFirstSeen) || other.timeFirstSeen == timeFirstSeen));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,tokenType,genesisInfo,block,timeFirstSeen);

@override
String toString() {
  return 'TokenInfo(tokenId: $tokenId, tokenType: $tokenType, genesisInfo: $genesisInfo, block: $block, timeFirstSeen: $timeFirstSeen)';
}


}

/// @nodoc
abstract mixin class $TokenInfoCopyWith<$Res>  {
  factory $TokenInfoCopyWith(TokenInfo value, $Res Function(TokenInfo) _then) = _$TokenInfoCopyWithImpl;
@useResult
$Res call({
 String tokenId, TokenType tokenType, GenesisInfo genesisInfo, int timeFirstSeen, BlockMetadata? block
});




}
/// @nodoc
class _$TokenInfoCopyWithImpl<$Res>
    implements $TokenInfoCopyWith<$Res> {
  _$TokenInfoCopyWithImpl(this._self, this._then);

  final TokenInfo _self;
  final $Res Function(TokenInfo) _then;

/// Create a copy of TokenInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? tokenType = null,Object? genesisInfo = null,Object? timeFirstSeen = null,Object? block = freezed,}) {
  return _then(TokenInfo(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as TokenType,genesisInfo: null == genesisInfo ? _self.genesisInfo : genesisInfo // ignore: cast_nullable_to_non_nullable
as GenesisInfo,timeFirstSeen: null == timeFirstSeen ? _self.timeFirstSeen : timeFirstSeen // ignore: cast_nullable_to_non_nullable
as int,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as BlockMetadata?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenInfo].
extension TokenInfoPatterns on TokenInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$GenesisInfo {

 String get tokenTicker; String get tokenName; String get url; String? get hash; String? get mintVaultScripthash; String? get data; String? get authPubKey; int get decimals;
/// Create a copy of GenesisInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenesisInfoCopyWith<GenesisInfo> get copyWith => _$GenesisInfoCopyWithImpl<GenesisInfo>(this as GenesisInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenesisInfo&&(identical(other.tokenTicker, tokenTicker) || other.tokenTicker == tokenTicker)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.url, url) || other.url == url)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.mintVaultScripthash, mintVaultScripthash) || other.mintVaultScripthash == mintVaultScripthash)&&(identical(other.data, data) || other.data == data)&&(identical(other.authPubKey, authPubKey) || other.authPubKey == authPubKey)&&(identical(other.decimals, decimals) || other.decimals == decimals));
}


@override
int get hashCode => Object.hash(runtimeType,tokenTicker,tokenName,url,hash,mintVaultScripthash,data,authPubKey,decimals);

@override
String toString() {
  return 'GenesisInfo(tokenTicker: $tokenTicker, tokenName: $tokenName, url: $url, hash: $hash, mintVaultScripthash: $mintVaultScripthash, data: $data, authPubKey: $authPubKey, decimals: $decimals)';
}


}

/// @nodoc
abstract mixin class $GenesisInfoCopyWith<$Res>  {
  factory $GenesisInfoCopyWith(GenesisInfo value, $Res Function(GenesisInfo) _then) = _$GenesisInfoCopyWithImpl;
@useResult
$Res call({
 String tokenTicker, String tokenName, String url, String? hash, String? mintVaultScripthash, String? data, String? authPubKey, int decimals
});




}
/// @nodoc
class _$GenesisInfoCopyWithImpl<$Res>
    implements $GenesisInfoCopyWith<$Res> {
  _$GenesisInfoCopyWithImpl(this._self, this._then);

  final GenesisInfo _self;
  final $Res Function(GenesisInfo) _then;

/// Create a copy of GenesisInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenTicker = null,Object? tokenName = null,Object? url = null,Object? hash = freezed,Object? mintVaultScripthash = freezed,Object? data = freezed,Object? authPubKey = freezed,Object? decimals = null,}) {
  return _then(GenesisInfo(
tokenTicker: null == tokenTicker ? _self.tokenTicker : tokenTicker // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,mintVaultScripthash: freezed == mintVaultScripthash ? _self.mintVaultScripthash : mintVaultScripthash // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,authPubKey: freezed == authPubKey ? _self.authPubKey : authPubKey // ignore: cast_nullable_to_non_nullable
as String?,decimals: null == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GenesisInfo].
extension GenesisInfoPatterns on GenesisInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TxHistoryPage {

 int get numPages; int get numTxs; List<Tx> get txs;
/// Create a copy of TxHistoryPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxHistoryPageCopyWith<TxHistoryPage> get copyWith => _$TxHistoryPageCopyWithImpl<TxHistoryPage>(this as TxHistoryPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxHistoryPage&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.numTxs, numTxs) || other.numTxs == numTxs)&&const DeepCollectionEquality().equals(other.txs, txs));
}


@override
int get hashCode => Object.hash(runtimeType,numPages,numTxs,const DeepCollectionEquality().hash(txs));

@override
String toString() {
  return 'TxHistoryPage(numPages: $numPages, numTxs: $numTxs, txs: $txs)';
}


}

/// @nodoc
abstract mixin class $TxHistoryPageCopyWith<$Res>  {
  factory $TxHistoryPageCopyWith(TxHistoryPage value, $Res Function(TxHistoryPage) _then) = _$TxHistoryPageCopyWithImpl;
@useResult
$Res call({
 int numPages, int numTxs, List<Tx> txs
});




}
/// @nodoc
class _$TxHistoryPageCopyWithImpl<$Res>
    implements $TxHistoryPageCopyWith<$Res> {
  _$TxHistoryPageCopyWithImpl(this._self, this._then);

  final TxHistoryPage _self;
  final $Res Function(TxHistoryPage) _then;

/// Create a copy of TxHistoryPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numPages = null,Object? numTxs = null,Object? txs = null,}) {
  return _then(TxHistoryPage(
numPages: null == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int,numTxs: null == numTxs ? _self.numTxs : numTxs // ignore: cast_nullable_to_non_nullable
as int,txs: null == txs ? _self.txs : txs // ignore: cast_nullable_to_non_nullable
as List<Tx>,
  ));
}

}


/// Adds pattern-matching-related methods to [TxHistoryPage].
extension TxHistoryPagePatterns on TxHistoryPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$ConfirmedTxsResponse {

 int get page; int get pageSize; List<Tx> get txs;
/// Create a copy of ConfirmedTxsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmedTxsResponseCopyWith<ConfirmedTxsResponse> get copyWith => _$ConfirmedTxsResponseCopyWithImpl<ConfirmedTxsResponse>(this as ConfirmedTxsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmedTxsResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.txs, txs));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,const DeepCollectionEquality().hash(txs));

@override
String toString() {
  return 'ConfirmedTxsResponse(page: $page, pageSize: $pageSize, txs: $txs)';
}


}

/// @nodoc
abstract mixin class $ConfirmedTxsResponseCopyWith<$Res>  {
  factory $ConfirmedTxsResponseCopyWith(ConfirmedTxsResponse value, $Res Function(ConfirmedTxsResponse) _then) = _$ConfirmedTxsResponseCopyWithImpl;
@useResult
$Res call({
 int page, int pageSize, List<Tx> txs
});




}
/// @nodoc
class _$ConfirmedTxsResponseCopyWithImpl<$Res>
    implements $ConfirmedTxsResponseCopyWith<$Res> {
  _$ConfirmedTxsResponseCopyWithImpl(this._self, this._then);

  final ConfirmedTxsResponse _self;
  final $Res Function(ConfirmedTxsResponse) _then;

/// Create a copy of ConfirmedTxsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,Object? txs = null,}) {
  return _then(ConfirmedTxsResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,txs: null == txs ? _self.txs : txs // ignore: cast_nullable_to_non_nullable
as List<Tx>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmedTxsResponse].
extension ConfirmedTxsResponsePatterns on ConfirmedTxsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$UtxosResponse {

 List<Utxo> get utxos;
/// Create a copy of UtxosResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtxosResponseCopyWith<UtxosResponse> get copyWith => _$UtxosResponseCopyWithImpl<UtxosResponse>(this as UtxosResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UtxosResponse&&const DeepCollectionEquality().equals(other.utxos, utxos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(utxos));

@override
String toString() {
  return 'UtxosResponse(utxos: $utxos)';
}


}

/// @nodoc
abstract mixin class $UtxosResponseCopyWith<$Res>  {
  factory $UtxosResponseCopyWith(UtxosResponse value, $Res Function(UtxosResponse) _then) = _$UtxosResponseCopyWithImpl;
@useResult
$Res call({
 List<Utxo> utxos
});




}
/// @nodoc
class _$UtxosResponseCopyWithImpl<$Res>
    implements $UtxosResponseCopyWith<$Res> {
  _$UtxosResponseCopyWithImpl(this._self, this._then);

  final UtxosResponse _self;
  final $Res Function(UtxosResponse) _then;

/// Create a copy of UtxosResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? utxos = null,}) {
  return _then(UtxosResponse(
utxos: null == utxos ? _self.utxos : utxos // ignore: cast_nullable_to_non_nullable
as List<Utxo>,
  ));
}

}


/// Adds pattern-matching-related methods to [UtxosResponse].
extension UtxosResponsePatterns on UtxosResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$BroadcastResponse {

 String get txid;
/// Create a copy of BroadcastResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastResponseCopyWith<BroadcastResponse> get copyWith => _$BroadcastResponseCopyWithImpl<BroadcastResponse>(this as BroadcastResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastResponse&&(identical(other.txid, txid) || other.txid == txid));
}


@override
int get hashCode => Object.hash(runtimeType,txid);

@override
String toString() {
  return 'BroadcastResponse(txid: $txid)';
}


}

/// @nodoc
abstract mixin class $BroadcastResponseCopyWith<$Res>  {
  factory $BroadcastResponseCopyWith(BroadcastResponse value, $Res Function(BroadcastResponse) _then) = _$BroadcastResponseCopyWithImpl;
@useResult
$Res call({
 String txid
});




}
/// @nodoc
class _$BroadcastResponseCopyWithImpl<$Res>
    implements $BroadcastResponseCopyWith<$Res> {
  _$BroadcastResponseCopyWithImpl(this._self, this._then);

  final BroadcastResponse _self;
  final $Res Function(BroadcastResponse) _then;

/// Create a copy of BroadcastResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? txid = null,}) {
  return _then(BroadcastResponse(
txid: null == txid ? _self.txid : txid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastResponse].
extension BroadcastResponsePatterns on BroadcastResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$BroadcastTxsResponse {

 List<String> get txids;
/// Create a copy of BroadcastTxsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastTxsResponseCopyWith<BroadcastTxsResponse> get copyWith => _$BroadcastTxsResponseCopyWithImpl<BroadcastTxsResponse>(this as BroadcastTxsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastTxsResponse&&const DeepCollectionEquality().equals(other.txids, txids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(txids));

@override
String toString() {
  return 'BroadcastTxsResponse(txids: $txids)';
}


}

/// @nodoc
abstract mixin class $BroadcastTxsResponseCopyWith<$Res>  {
  factory $BroadcastTxsResponseCopyWith(BroadcastTxsResponse value, $Res Function(BroadcastTxsResponse) _then) = _$BroadcastTxsResponseCopyWithImpl;
@useResult
$Res call({
 List<String> txids
});




}
/// @nodoc
class _$BroadcastTxsResponseCopyWithImpl<$Res>
    implements $BroadcastTxsResponseCopyWith<$Res> {
  _$BroadcastTxsResponseCopyWithImpl(this._self, this._then);

  final BroadcastTxsResponse _self;
  final $Res Function(BroadcastTxsResponse) _then;

/// Create a copy of BroadcastTxsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? txids = null,}) {
  return _then(BroadcastTxsResponse(
txids: null == txids ? _self.txids : txids // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastTxsResponse].
extension BroadcastTxsResponsePatterns on BroadcastTxsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$PluginGroups {

 List<PluginGroup> get groups; String get nextStart;
/// Create a copy of PluginGroups
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PluginGroupsCopyWith<PluginGroups> get copyWith => _$PluginGroupsCopyWithImpl<PluginGroups>(this as PluginGroups, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PluginGroups&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.nextStart, nextStart) || other.nextStart == nextStart));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),nextStart);

@override
String toString() {
  return 'PluginGroups(groups: $groups, nextStart: $nextStart)';
}


}

/// @nodoc
abstract mixin class $PluginGroupsCopyWith<$Res>  {
  factory $PluginGroupsCopyWith(PluginGroups value, $Res Function(PluginGroups) _then) = _$PluginGroupsCopyWithImpl;
@useResult
$Res call({
 List<PluginGroup> groups, String nextStart
});




}
/// @nodoc
class _$PluginGroupsCopyWithImpl<$Res>
    implements $PluginGroupsCopyWith<$Res> {
  _$PluginGroupsCopyWithImpl(this._self, this._then);

  final PluginGroups _self;
  final $Res Function(PluginGroups) _then;

/// Create a copy of PluginGroups
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? nextStart = null,}) {
  return _then(PluginGroups(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<PluginGroup>,nextStart: null == nextStart ? _self.nextStart : nextStart // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PluginGroups].
extension PluginGroupsPatterns on PluginGroups {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$PluginGroup {

 String get group;
/// Create a copy of PluginGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PluginGroupCopyWith<PluginGroup> get copyWith => _$PluginGroupCopyWithImpl<PluginGroup>(this as PluginGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PluginGroup&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,group);

@override
String toString() {
  return 'PluginGroup(group: $group)';
}


}

/// @nodoc
abstract mixin class $PluginGroupCopyWith<$Res>  {
  factory $PluginGroupCopyWith(PluginGroup value, $Res Function(PluginGroup) _then) = _$PluginGroupCopyWithImpl;
@useResult
$Res call({
 String group
});




}
/// @nodoc
class _$PluginGroupCopyWithImpl<$Res>
    implements $PluginGroupCopyWith<$Res> {
  _$PluginGroupCopyWithImpl(this._self, this._then);

  final PluginGroup _self;
  final $Res Function(PluginGroup) _then;

/// Create a copy of PluginGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? group = null,}) {
  return _then(PluginGroup(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PluginGroup].
extension PluginGroupPatterns on PluginGroup {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$WsMsgClient {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMsgClient);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsMsgClient()';
}


}

/// @nodoc
class $WsMsgClientCopyWith<$Res>  {
$WsMsgClientCopyWith(WsMsgClient _, $Res Function(WsMsgClient) __);
}


/// Adds pattern-matching-related methods to [WsMsgClient].
extension WsMsgClientPatterns on WsMsgClient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WsErrorMsg value)?  error,TResult Function( WsMsgBlockClient value)?  block,TResult Function( WsMsgTxClient value)?  tx,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WsErrorMsg() when error != null:
return error(_that);case WsMsgBlockClient() when block != null:
return block(_that);case WsMsgTxClient() when tx != null:
return tx(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WsErrorMsg value)  error,required TResult Function( WsMsgBlockClient value)  block,required TResult Function( WsMsgTxClient value)  tx,}){
final _that = this;
switch (_that) {
case WsErrorMsg():
return error(_that);case WsMsgBlockClient():
return block(_that);case WsMsgTxClient():
return tx(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WsErrorMsg value)?  error,TResult? Function( WsMsgBlockClient value)?  block,TResult? Function( WsMsgTxClient value)?  tx,}){
final _that = this;
switch (_that) {
case WsErrorMsg() when error != null:
return error(_that);case WsMsgBlockClient() when block != null:
return block(_that);case WsMsgTxClient() when tx != null:
return tx(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( pb.Error error)?  error,TResult Function( BlockMsgType msgType,  String blockHash,  int blockHeight,  Int64 blockTimestamp,  pb.CoinbaseData? coinbaseData)?  block,TResult Function( TxMsgType msgType,  String txid,  TxFinalizationReasonType? finalizationReasonType)?  tx,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WsErrorMsg() when error != null:
return error(_that.error);case WsMsgBlockClient() when block != null:
return block(_that.msgType,_that.blockHash,_that.blockHeight,_that.blockTimestamp,_that.coinbaseData);case WsMsgTxClient() when tx != null:
return tx(_that.msgType,_that.txid,_that.finalizationReasonType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( pb.Error error)  error,required TResult Function( BlockMsgType msgType,  String blockHash,  int blockHeight,  Int64 blockTimestamp,  pb.CoinbaseData? coinbaseData)  block,required TResult Function( TxMsgType msgType,  String txid,  TxFinalizationReasonType? finalizationReasonType)  tx,}) {final _that = this;
switch (_that) {
case WsErrorMsg():
return error(_that.error);case WsMsgBlockClient():
return block(_that.msgType,_that.blockHash,_that.blockHeight,_that.blockTimestamp,_that.coinbaseData);case WsMsgTxClient():
return tx(_that.msgType,_that.txid,_that.finalizationReasonType);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( pb.Error error)?  error,TResult? Function( BlockMsgType msgType,  String blockHash,  int blockHeight,  Int64 blockTimestamp,  pb.CoinbaseData? coinbaseData)?  block,TResult? Function( TxMsgType msgType,  String txid,  TxFinalizationReasonType? finalizationReasonType)?  tx,}) {final _that = this;
switch (_that) {
case WsErrorMsg() when error != null:
return error(_that.error);case WsMsgBlockClient() when block != null:
return block(_that.msgType,_that.blockHash,_that.blockHeight,_that.blockTimestamp,_that.coinbaseData);case WsMsgTxClient() when tx != null:
return tx(_that.msgType,_that.txid,_that.finalizationReasonType);case _:
  return null;

}
}

}

/// @nodoc


class WsErrorMsg implements WsMsgClient {
  const WsErrorMsg(this.error);
  

 final  pb.Error error;

/// Create a copy of WsMsgClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsErrorMsgCopyWith<WsErrorMsg> get copyWith => _$WsErrorMsgCopyWithImpl<WsErrorMsg>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsErrorMsg&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WsMsgClient.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $WsErrorMsgCopyWith<$Res> implements $WsMsgClientCopyWith<$Res> {
  factory $WsErrorMsgCopyWith(WsErrorMsg value, $Res Function(WsErrorMsg) _then) = _$WsErrorMsgCopyWithImpl;
@useResult
$Res call({
 pb.Error error
});




}
/// @nodoc
class _$WsErrorMsgCopyWithImpl<$Res>
    implements $WsErrorMsgCopyWith<$Res> {
  _$WsErrorMsgCopyWithImpl(this._self, this._then);

  final WsErrorMsg _self;
  final $Res Function(WsErrorMsg) _then;

/// Create a copy of WsMsgClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(WsErrorMsg(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as pb.Error,
  ));
}


}

/// @nodoc


class WsMsgBlockClient implements WsMsgClient {
  const WsMsgBlockClient({required this.msgType, required this.blockHash, required this.blockHeight, required this.blockTimestamp, this.coinbaseData});
  

 final  BlockMsgType msgType;
 final  String blockHash;
 final  int blockHeight;
 final  Int64 blockTimestamp;
 final  pb.CoinbaseData? coinbaseData;

/// Create a copy of WsMsgClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsMsgBlockClientCopyWith<WsMsgBlockClient> get copyWith => _$WsMsgBlockClientCopyWithImpl<WsMsgBlockClient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMsgBlockClient&&(identical(other.msgType, msgType) || other.msgType == msgType)&&(identical(other.blockHash, blockHash) || other.blockHash == blockHash)&&(identical(other.blockHeight, blockHeight) || other.blockHeight == blockHeight)&&(identical(other.blockTimestamp, blockTimestamp) || other.blockTimestamp == blockTimestamp)&&(identical(other.coinbaseData, coinbaseData) || other.coinbaseData == coinbaseData));
}


@override
int get hashCode => Object.hash(runtimeType,msgType,blockHash,blockHeight,blockTimestamp,coinbaseData);

@override
String toString() {
  return 'WsMsgClient.block(msgType: $msgType, blockHash: $blockHash, blockHeight: $blockHeight, blockTimestamp: $blockTimestamp, coinbaseData: $coinbaseData)';
}


}

/// @nodoc
abstract mixin class $WsMsgBlockClientCopyWith<$Res> implements $WsMsgClientCopyWith<$Res> {
  factory $WsMsgBlockClientCopyWith(WsMsgBlockClient value, $Res Function(WsMsgBlockClient) _then) = _$WsMsgBlockClientCopyWithImpl;
@useResult
$Res call({
 BlockMsgType msgType, String blockHash, int blockHeight, Int64 blockTimestamp, pb.CoinbaseData? coinbaseData
});




}
/// @nodoc
class _$WsMsgBlockClientCopyWithImpl<$Res>
    implements $WsMsgBlockClientCopyWith<$Res> {
  _$WsMsgBlockClientCopyWithImpl(this._self, this._then);

  final WsMsgBlockClient _self;
  final $Res Function(WsMsgBlockClient) _then;

/// Create a copy of WsMsgClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msgType = null,Object? blockHash = null,Object? blockHeight = null,Object? blockTimestamp = null,Object? coinbaseData = freezed,}) {
  return _then(WsMsgBlockClient(
msgType: null == msgType ? _self.msgType : msgType // ignore: cast_nullable_to_non_nullable
as BlockMsgType,blockHash: null == blockHash ? _self.blockHash : blockHash // ignore: cast_nullable_to_non_nullable
as String,blockHeight: null == blockHeight ? _self.blockHeight : blockHeight // ignore: cast_nullable_to_non_nullable
as int,blockTimestamp: null == blockTimestamp ? _self.blockTimestamp : blockTimestamp // ignore: cast_nullable_to_non_nullable
as Int64,coinbaseData: freezed == coinbaseData ? _self.coinbaseData : coinbaseData // ignore: cast_nullable_to_non_nullable
as pb.CoinbaseData?,
  ));
}


}

/// @nodoc


class WsMsgTxClient implements WsMsgClient {
  const WsMsgTxClient({required this.msgType, required this.txid, this.finalizationReasonType});
  

 final  TxMsgType msgType;
 final  String txid;
 final  TxFinalizationReasonType? finalizationReasonType;

/// Create a copy of WsMsgClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsMsgTxClientCopyWith<WsMsgTxClient> get copyWith => _$WsMsgTxClientCopyWithImpl<WsMsgTxClient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMsgTxClient&&(identical(other.msgType, msgType) || other.msgType == msgType)&&(identical(other.txid, txid) || other.txid == txid)&&(identical(other.finalizationReasonType, finalizationReasonType) || other.finalizationReasonType == finalizationReasonType));
}


@override
int get hashCode => Object.hash(runtimeType,msgType,txid,finalizationReasonType);

@override
String toString() {
  return 'WsMsgClient.tx(msgType: $msgType, txid: $txid, finalizationReasonType: $finalizationReasonType)';
}


}

/// @nodoc
abstract mixin class $WsMsgTxClientCopyWith<$Res> implements $WsMsgClientCopyWith<$Res> {
  factory $WsMsgTxClientCopyWith(WsMsgTxClient value, $Res Function(WsMsgTxClient) _then) = _$WsMsgTxClientCopyWithImpl;
@useResult
$Res call({
 TxMsgType msgType, String txid, TxFinalizationReasonType? finalizationReasonType
});




}
/// @nodoc
class _$WsMsgTxClientCopyWithImpl<$Res>
    implements $WsMsgTxClientCopyWith<$Res> {
  _$WsMsgTxClientCopyWithImpl(this._self, this._then);

  final WsMsgTxClient _self;
  final $Res Function(WsMsgTxClient) _then;

/// Create a copy of WsMsgClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msgType = null,Object? txid = null,Object? finalizationReasonType = freezed,}) {
  return _then(WsMsgTxClient(
msgType: null == msgType ? _self.msgType : msgType // ignore: cast_nullable_to_non_nullable
as TxMsgType,txid: null == txid ? _self.txid : txid // ignore: cast_nullable_to_non_nullable
as String,finalizationReasonType: freezed == finalizationReasonType ? _self.finalizationReasonType : finalizationReasonType // ignore: cast_nullable_to_non_nullable
as TxFinalizationReasonType?,
  ));
}


}

/// @nodoc
mixin _$WsSubScriptClient {

 String get scriptType; String get payload;
/// Create a copy of WsSubScriptClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsSubScriptClientCopyWith<WsSubScriptClient> get copyWith => _$WsSubScriptClientCopyWithImpl<WsSubScriptClient>(this as WsSubScriptClient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsSubScriptClient&&(identical(other.scriptType, scriptType) || other.scriptType == scriptType)&&(identical(other.payload, payload) || other.payload == payload));
}


@override
int get hashCode => Object.hash(runtimeType,scriptType,payload);

@override
String toString() {
  return 'WsSubScriptClient(scriptType: $scriptType, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $WsSubScriptClientCopyWith<$Res>  {
  factory $WsSubScriptClientCopyWith(WsSubScriptClient value, $Res Function(WsSubScriptClient) _then) = _$WsSubScriptClientCopyWithImpl;
@useResult
$Res call({
 String scriptType, String payload
});




}
/// @nodoc
class _$WsSubScriptClientCopyWithImpl<$Res>
    implements $WsSubScriptClientCopyWith<$Res> {
  _$WsSubScriptClientCopyWithImpl(this._self, this._then);

  final WsSubScriptClient _self;
  final $Res Function(WsSubScriptClient) _then;

/// Create a copy of WsSubScriptClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scriptType = null,Object? payload = null,}) {
  return _then(WsSubScriptClient(
scriptType: null == scriptType ? _self.scriptType : scriptType // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WsSubScriptClient].
extension WsSubScriptClientPatterns on WsSubScriptClient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$WsSubPluginClient {

 String get pluginName; String get group;
/// Create a copy of WsSubPluginClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsSubPluginClientCopyWith<WsSubPluginClient> get copyWith => _$WsSubPluginClientCopyWithImpl<WsSubPluginClient>(this as WsSubPluginClient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsSubPluginClient&&(identical(other.pluginName, pluginName) || other.pluginName == pluginName)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,pluginName,group);

@override
String toString() {
  return 'WsSubPluginClient(pluginName: $pluginName, group: $group)';
}


}

/// @nodoc
abstract mixin class $WsSubPluginClientCopyWith<$Res>  {
  factory $WsSubPluginClientCopyWith(WsSubPluginClient value, $Res Function(WsSubPluginClient) _then) = _$WsSubPluginClientCopyWithImpl;
@useResult
$Res call({
 String pluginName, String group
});




}
/// @nodoc
class _$WsSubPluginClientCopyWithImpl<$Res>
    implements $WsSubPluginClientCopyWith<$Res> {
  _$WsSubPluginClientCopyWithImpl(this._self, this._then);

  final WsSubPluginClient _self;
  final $Res Function(WsSubPluginClient) _then;

/// Create a copy of WsSubPluginClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pluginName = null,Object? group = null,}) {
  return _then(WsSubPluginClient(
pluginName: null == pluginName ? _self.pluginName : pluginName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WsSubPluginClient].
extension WsSubPluginClientPatterns on WsSubPluginClient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$BlockchainInfo {

 String get tipHash; int get tipHeight;
/// Create a copy of BlockchainInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockchainInfoCopyWith<BlockchainInfo> get copyWith => _$BlockchainInfoCopyWithImpl<BlockchainInfo>(this as BlockchainInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockchainInfo&&(identical(other.tipHash, tipHash) || other.tipHash == tipHash)&&(identical(other.tipHeight, tipHeight) || other.tipHeight == tipHeight));
}


@override
int get hashCode => Object.hash(runtimeType,tipHash,tipHeight);

@override
String toString() {
  return 'BlockchainInfo(tipHash: $tipHash, tipHeight: $tipHeight)';
}


}

/// @nodoc
abstract mixin class $BlockchainInfoCopyWith<$Res>  {
  factory $BlockchainInfoCopyWith(BlockchainInfo value, $Res Function(BlockchainInfo) _then) = _$BlockchainInfoCopyWithImpl;
@useResult
$Res call({
 String tipHash, int tipHeight
});




}
/// @nodoc
class _$BlockchainInfoCopyWithImpl<$Res>
    implements $BlockchainInfoCopyWith<$Res> {
  _$BlockchainInfoCopyWithImpl(this._self, this._then);

  final BlockchainInfo _self;
  final $Res Function(BlockchainInfo) _then;

/// Create a copy of BlockchainInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tipHash = null,Object? tipHeight = null,}) {
  return _then(BlockchainInfo(
tipHash: null == tipHash ? _self.tipHash : tipHash // ignore: cast_nullable_to_non_nullable
as String,tipHeight: null == tipHeight ? _self.tipHeight : tipHeight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockchainInfo].
extension BlockchainInfoPatterns on BlockchainInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$ChronikInfo {

 String get version;
/// Create a copy of ChronikInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChronikInfoCopyWith<ChronikInfo> get copyWith => _$ChronikInfoCopyWithImpl<ChronikInfo>(this as ChronikInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChronikInfo&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'ChronikInfo(version: $version)';
}


}

/// @nodoc
abstract mixin class $ChronikInfoCopyWith<$Res>  {
  factory $ChronikInfoCopyWith(ChronikInfo value, $Res Function(ChronikInfo) _then) = _$ChronikInfoCopyWithImpl;
@useResult
$Res call({
 String version
});




}
/// @nodoc
class _$ChronikInfoCopyWithImpl<$Res>
    implements $ChronikInfoCopyWith<$Res> {
  _$ChronikInfoCopyWithImpl(this._self, this._then);

  final ChronikInfo _self;
  final $Res Function(ChronikInfo) _then;

/// Create a copy of ChronikInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,}) {
  return _then(ChronikInfo(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChronikInfo].
extension ChronikInfoPatterns on ChronikInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$BlockInfo {

 String get hash; String get prevHash; int get height; int get nBits; int get timestamp; bool get isFinal; int get blockSize; int get numTxs; int get numInputs; int get numOutputs; int get sumInputSats; int get sumCoinbaseOutputSats; int get sumNormalOutputSats; int get sumBurnedSats;
/// Create a copy of BlockInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockInfoCopyWith<BlockInfo> get copyWith => _$BlockInfoCopyWithImpl<BlockInfo>(this as BlockInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockInfo&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.prevHash, prevHash) || other.prevHash == prevHash)&&(identical(other.height, height) || other.height == height)&&(identical(other.nBits, nBits) || other.nBits == nBits)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal)&&(identical(other.blockSize, blockSize) || other.blockSize == blockSize)&&(identical(other.numTxs, numTxs) || other.numTxs == numTxs)&&(identical(other.numInputs, numInputs) || other.numInputs == numInputs)&&(identical(other.numOutputs, numOutputs) || other.numOutputs == numOutputs)&&(identical(other.sumInputSats, sumInputSats) || other.sumInputSats == sumInputSats)&&(identical(other.sumCoinbaseOutputSats, sumCoinbaseOutputSats) || other.sumCoinbaseOutputSats == sumCoinbaseOutputSats)&&(identical(other.sumNormalOutputSats, sumNormalOutputSats) || other.sumNormalOutputSats == sumNormalOutputSats)&&(identical(other.sumBurnedSats, sumBurnedSats) || other.sumBurnedSats == sumBurnedSats));
}


@override
int get hashCode => Object.hash(runtimeType,hash,prevHash,height,nBits,timestamp,isFinal,blockSize,numTxs,numInputs,numOutputs,sumInputSats,sumCoinbaseOutputSats,sumNormalOutputSats,sumBurnedSats);

@override
String toString() {
  return 'BlockInfo(hash: $hash, prevHash: $prevHash, height: $height, nBits: $nBits, timestamp: $timestamp, isFinal: $isFinal, blockSize: $blockSize, numTxs: $numTxs, numInputs: $numInputs, numOutputs: $numOutputs, sumInputSats: $sumInputSats, sumCoinbaseOutputSats: $sumCoinbaseOutputSats, sumNormalOutputSats: $sumNormalOutputSats, sumBurnedSats: $sumBurnedSats)';
}


}

/// @nodoc
abstract mixin class $BlockInfoCopyWith<$Res>  {
  factory $BlockInfoCopyWith(BlockInfo value, $Res Function(BlockInfo) _then) = _$BlockInfoCopyWithImpl;
@useResult
$Res call({
 String hash, String prevHash, int height, int nBits, int timestamp, bool isFinal, int blockSize, int numTxs, int numInputs, int numOutputs, int sumInputSats, int sumCoinbaseOutputSats, int sumNormalOutputSats, int sumBurnedSats
});




}
/// @nodoc
class _$BlockInfoCopyWithImpl<$Res>
    implements $BlockInfoCopyWith<$Res> {
  _$BlockInfoCopyWithImpl(this._self, this._then);

  final BlockInfo _self;
  final $Res Function(BlockInfo) _then;

/// Create a copy of BlockInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? prevHash = null,Object? height = null,Object? nBits = null,Object? timestamp = null,Object? isFinal = null,Object? blockSize = null,Object? numTxs = null,Object? numInputs = null,Object? numOutputs = null,Object? sumInputSats = null,Object? sumCoinbaseOutputSats = null,Object? sumNormalOutputSats = null,Object? sumBurnedSats = null,}) {
  return _then(BlockInfo(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,prevHash: null == prevHash ? _self.prevHash : prevHash // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,nBits: null == nBits ? _self.nBits : nBits // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,blockSize: null == blockSize ? _self.blockSize : blockSize // ignore: cast_nullable_to_non_nullable
as int,numTxs: null == numTxs ? _self.numTxs : numTxs // ignore: cast_nullable_to_non_nullable
as int,numInputs: null == numInputs ? _self.numInputs : numInputs // ignore: cast_nullable_to_non_nullable
as int,numOutputs: null == numOutputs ? _self.numOutputs : numOutputs // ignore: cast_nullable_to_non_nullable
as int,sumInputSats: null == sumInputSats ? _self.sumInputSats : sumInputSats // ignore: cast_nullable_to_non_nullable
as int,sumCoinbaseOutputSats: null == sumCoinbaseOutputSats ? _self.sumCoinbaseOutputSats : sumCoinbaseOutputSats // ignore: cast_nullable_to_non_nullable
as int,sumNormalOutputSats: null == sumNormalOutputSats ? _self.sumNormalOutputSats : sumNormalOutputSats // ignore: cast_nullable_to_non_nullable
as int,sumBurnedSats: null == sumBurnedSats ? _self.sumBurnedSats : sumBurnedSats // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockInfo].
extension BlockInfoPatterns on BlockInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$Block {

 BlockInfo get blockInfo;
/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockCopyWith<Block> get copyWith => _$BlockCopyWithImpl<Block>(this as Block, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Block&&(identical(other.blockInfo, blockInfo) || other.blockInfo == blockInfo));
}


@override
int get hashCode => Object.hash(runtimeType,blockInfo);

@override
String toString() {
  return 'Block(blockInfo: $blockInfo)';
}


}

/// @nodoc
abstract mixin class $BlockCopyWith<$Res>  {
  factory $BlockCopyWith(Block value, $Res Function(Block) _then) = _$BlockCopyWithImpl;
@useResult
$Res call({
 BlockInfo blockInfo
});




}
/// @nodoc
class _$BlockCopyWithImpl<$Res>
    implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._self, this._then);

  final Block _self;
  final $Res Function(Block) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blockInfo = null,}) {
  return _then(Block(
blockInfo: null == blockInfo ? _self.blockInfo : blockInfo // ignore: cast_nullable_to_non_nullable
as BlockInfo,
  ));
}

}


/// Adds pattern-matching-related methods to [Block].
extension BlockPatterns on Block {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$OutPoint {

 String get txid; int get outIdx;
/// Create a copy of OutPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutPointCopyWith<OutPoint> get copyWith => _$OutPointCopyWithImpl<OutPoint>(this as OutPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutPoint&&(identical(other.txid, txid) || other.txid == txid)&&(identical(other.outIdx, outIdx) || other.outIdx == outIdx));
}


@override
int get hashCode => Object.hash(runtimeType,txid,outIdx);

@override
String toString() {
  return 'OutPoint(txid: $txid, outIdx: $outIdx)';
}


}

/// @nodoc
abstract mixin class $OutPointCopyWith<$Res>  {
  factory $OutPointCopyWith(OutPoint value, $Res Function(OutPoint) _then) = _$OutPointCopyWithImpl;
@useResult
$Res call({
 String txid, int outIdx
});




}
/// @nodoc
class _$OutPointCopyWithImpl<$Res>
    implements $OutPointCopyWith<$Res> {
  _$OutPointCopyWithImpl(this._self, this._then);

  final OutPoint _self;
  final $Res Function(OutPoint) _then;

/// Create a copy of OutPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? txid = null,Object? outIdx = null,}) {
  return _then(OutPoint(
txid: null == txid ? _self.txid : txid // ignore: cast_nullable_to_non_nullable
as String,outIdx: null == outIdx ? _self.outIdx : outIdx // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OutPoint].
extension OutPointPatterns on OutPoint {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TokenType {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TokenType()';
}


}

/// @nodoc
class $TokenTypeCopyWith<$Res>  {
$TokenTypeCopyWith(TokenType _, $Res Function(TokenType) __);
}


/// Adds pattern-matching-related methods to [TokenType].
extension TokenTypePatterns on TokenType {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SlpTokenType value)?  slp,TResult Function( AlpTokenType value)?  alp,TResult Function( UnknownTokenType value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SlpTokenType() when slp != null:
return slp(_that);case AlpTokenType() when alp != null:
return alp(_that);case UnknownTokenType() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SlpTokenType value)  slp,required TResult Function( AlpTokenType value)  alp,required TResult Function( UnknownTokenType value)  unknown,}){
final _that = this;
switch (_that) {
case SlpTokenType():
return slp(_that);case AlpTokenType():
return alp(_that);case UnknownTokenType():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SlpTokenType value)?  slp,TResult? Function( AlpTokenType value)?  alp,TResult? Function( UnknownTokenType value)?  unknown,}){
final _that = this;
switch (_that) {
case SlpTokenType() when slp != null:
return slp(_that);case AlpTokenType() when alp != null:
return alp(_that);case UnknownTokenType() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SlpTokenTypeValue type,  int number)?  slp,TResult Function( AlpTokenTypeValue type,  int number)?  alp,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SlpTokenType() when slp != null:
return slp(_that.type,_that.number);case AlpTokenType() when alp != null:
return alp(_that.type,_that.number);case UnknownTokenType() when unknown != null:
return unknown();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SlpTokenTypeValue type,  int number)  slp,required TResult Function( AlpTokenTypeValue type,  int number)  alp,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case SlpTokenType():
return slp(_that.type,_that.number);case AlpTokenType():
return alp(_that.type,_that.number);case UnknownTokenType():
return unknown();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SlpTokenTypeValue type,  int number)?  slp,TResult? Function( AlpTokenTypeValue type,  int number)?  alp,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case SlpTokenType() when slp != null:
return slp(_that.type,_that.number);case AlpTokenType() when alp != null:
return alp(_that.type,_that.number);case UnknownTokenType() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class SlpTokenType implements TokenType {
  const SlpTokenType({required this.type, required this.number});
  

 final  SlpTokenTypeValue type;
 final  int number;

/// Create a copy of TokenType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlpTokenTypeCopyWith<SlpTokenType> get copyWith => _$SlpTokenTypeCopyWithImpl<SlpTokenType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlpTokenType&&(identical(other.type, type) || other.type == type)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,type,number);

@override
String toString() {
  return 'TokenType.slp(type: $type, number: $number)';
}


}

/// @nodoc
abstract mixin class $SlpTokenTypeCopyWith<$Res> implements $TokenTypeCopyWith<$Res> {
  factory $SlpTokenTypeCopyWith(SlpTokenType value, $Res Function(SlpTokenType) _then) = _$SlpTokenTypeCopyWithImpl;
@useResult
$Res call({
 SlpTokenTypeValue type, int number
});




}
/// @nodoc
class _$SlpTokenTypeCopyWithImpl<$Res>
    implements $SlpTokenTypeCopyWith<$Res> {
  _$SlpTokenTypeCopyWithImpl(this._self, this._then);

  final SlpTokenType _self;
  final $Res Function(SlpTokenType) _then;

/// Create a copy of TokenType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? number = null,}) {
  return _then(SlpTokenType(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SlpTokenTypeValue,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AlpTokenType implements TokenType {
  const AlpTokenType({required this.type, required this.number});
  

 final  AlpTokenTypeValue type;
 final  int number;

/// Create a copy of TokenType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlpTokenTypeCopyWith<AlpTokenType> get copyWith => _$AlpTokenTypeCopyWithImpl<AlpTokenType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlpTokenType&&(identical(other.type, type) || other.type == type)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,type,number);

@override
String toString() {
  return 'TokenType.alp(type: $type, number: $number)';
}


}

/// @nodoc
abstract mixin class $AlpTokenTypeCopyWith<$Res> implements $TokenTypeCopyWith<$Res> {
  factory $AlpTokenTypeCopyWith(AlpTokenType value, $Res Function(AlpTokenType) _then) = _$AlpTokenTypeCopyWithImpl;
@useResult
$Res call({
 AlpTokenTypeValue type, int number
});




}
/// @nodoc
class _$AlpTokenTypeCopyWithImpl<$Res>
    implements $AlpTokenTypeCopyWith<$Res> {
  _$AlpTokenTypeCopyWithImpl(this._self, this._then);

  final AlpTokenType _self;
  final $Res Function(AlpTokenType) _then;

/// Create a copy of TokenType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? number = null,}) {
  return _then(AlpTokenType(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AlpTokenTypeValue,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UnknownTokenType implements TokenType {
  const UnknownTokenType();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownTokenType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TokenType.unknown()';
}


}




/// @nodoc
mixin _$Token {

 String get tokenId; Object get tokenType; BigInt get atoms; bool get isMintBaton; int? get entryIdx;
/// Create a copy of Token
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenCopyWith<Token> get copyWith => _$TokenCopyWithImpl<Token>(this as Token, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Token&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other.tokenType, tokenType)&&(identical(other.atoms, atoms) || other.atoms == atoms)&&(identical(other.isMintBaton, isMintBaton) || other.isMintBaton == isMintBaton)&&(identical(other.entryIdx, entryIdx) || other.entryIdx == entryIdx));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(tokenType),atoms,isMintBaton,entryIdx);

@override
String toString() {
  return 'Token(tokenId: $tokenId, tokenType: $tokenType, atoms: $atoms, isMintBaton: $isMintBaton, entryIdx: $entryIdx)';
}


}

/// @nodoc
abstract mixin class $TokenCopyWith<$Res>  {
  factory $TokenCopyWith(Token value, $Res Function(Token) _then) = _$TokenCopyWithImpl;
@useResult
$Res call({
 String tokenId, Object tokenType, BigInt atoms, bool isMintBaton, int? entryIdx
});




}
/// @nodoc
class _$TokenCopyWithImpl<$Res>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._self, this._then);

  final Token _self;
  final $Res Function(Token) _then;

/// Create a copy of Token
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? tokenType = null,Object? atoms = null,Object? isMintBaton = null,Object? entryIdx = freezed,}) {
  return _then(Token(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType ,atoms: null == atoms ? _self.atoms : atoms // ignore: cast_nullable_to_non_nullable
as BigInt,isMintBaton: null == isMintBaton ? _self.isMintBaton : isMintBaton // ignore: cast_nullable_to_non_nullable
as bool,entryIdx: freezed == entryIdx ? _self.entryIdx : entryIdx // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Token].
extension TokenPatterns on Token {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TokenFailedColoring {

 int get pushdataIdx; String get error;
/// Create a copy of TokenFailedColoring
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenFailedColoringCopyWith<TokenFailedColoring> get copyWith => _$TokenFailedColoringCopyWithImpl<TokenFailedColoring>(this as TokenFailedColoring, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenFailedColoring&&(identical(other.pushdataIdx, pushdataIdx) || other.pushdataIdx == pushdataIdx)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,pushdataIdx,error);

@override
String toString() {
  return 'TokenFailedColoring(pushdataIdx: $pushdataIdx, error: $error)';
}


}

/// @nodoc
abstract mixin class $TokenFailedColoringCopyWith<$Res>  {
  factory $TokenFailedColoringCopyWith(TokenFailedColoring value, $Res Function(TokenFailedColoring) _then) = _$TokenFailedColoringCopyWithImpl;
@useResult
$Res call({
 int pushdataIdx, String error
});




}
/// @nodoc
class _$TokenFailedColoringCopyWithImpl<$Res>
    implements $TokenFailedColoringCopyWith<$Res> {
  _$TokenFailedColoringCopyWithImpl(this._self, this._then);

  final TokenFailedColoring _self;
  final $Res Function(TokenFailedColoring) _then;

/// Create a copy of TokenFailedColoring
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushdataIdx = null,Object? error = null,}) {
  return _then(TokenFailedColoring(
pushdataIdx: null == pushdataIdx ? _self.pushdataIdx : pushdataIdx // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenFailedColoring].
extension TokenFailedColoringPatterns on TokenFailedColoring {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TokenFailedParsing {

 int get pushdataIdx; String get bytes; String get error;
/// Create a copy of TokenFailedParsing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenFailedParsingCopyWith<TokenFailedParsing> get copyWith => _$TokenFailedParsingCopyWithImpl<TokenFailedParsing>(this as TokenFailedParsing, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenFailedParsing&&(identical(other.pushdataIdx, pushdataIdx) || other.pushdataIdx == pushdataIdx)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,pushdataIdx,bytes,error);

@override
String toString() {
  return 'TokenFailedParsing(pushdataIdx: $pushdataIdx, bytes: $bytes, error: $error)';
}


}

/// @nodoc
abstract mixin class $TokenFailedParsingCopyWith<$Res>  {
  factory $TokenFailedParsingCopyWith(TokenFailedParsing value, $Res Function(TokenFailedParsing) _then) = _$TokenFailedParsingCopyWithImpl;
@useResult
$Res call({
 int pushdataIdx, String bytes, String error
});




}
/// @nodoc
class _$TokenFailedParsingCopyWithImpl<$Res>
    implements $TokenFailedParsingCopyWith<$Res> {
  _$TokenFailedParsingCopyWithImpl(this._self, this._then);

  final TokenFailedParsing _self;
  final $Res Function(TokenFailedParsing) _then;

/// Create a copy of TokenFailedParsing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushdataIdx = null,Object? bytes = null,Object? error = null,}) {
  return _then(TokenFailedParsing(
pushdataIdx: null == pushdataIdx ? _self.pushdataIdx : pushdataIdx // ignore: cast_nullable_to_non_nullable
as int,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenFailedParsing].
extension TokenFailedParsingPatterns on TokenFailedParsing {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TokenEntry {

 String get tokenId; Object get tokenType; TokenTxType get txType; String? get groupTokenId; bool get isInvalid; String get burnSummary; List<TokenFailedColoring> get failedColorings; BigInt get actualBurnAtoms; BigInt get intentionalBurnAtoms; bool get burnsMintBatons;
/// Create a copy of TokenEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenEntryCopyWith<TokenEntry> get copyWith => _$TokenEntryCopyWithImpl<TokenEntry>(this as TokenEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenEntry&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other.tokenType, tokenType)&&(identical(other.txType, txType) || other.txType == txType)&&(identical(other.groupTokenId, groupTokenId) || other.groupTokenId == groupTokenId)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.burnSummary, burnSummary) || other.burnSummary == burnSummary)&&const DeepCollectionEquality().equals(other.failedColorings, failedColorings)&&(identical(other.actualBurnAtoms, actualBurnAtoms) || other.actualBurnAtoms == actualBurnAtoms)&&(identical(other.intentionalBurnAtoms, intentionalBurnAtoms) || other.intentionalBurnAtoms == intentionalBurnAtoms)&&(identical(other.burnsMintBatons, burnsMintBatons) || other.burnsMintBatons == burnsMintBatons));
}


@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(tokenType),txType,groupTokenId,isInvalid,burnSummary,const DeepCollectionEquality().hash(failedColorings),actualBurnAtoms,intentionalBurnAtoms,burnsMintBatons);

@override
String toString() {
  return 'TokenEntry(tokenId: $tokenId, tokenType: $tokenType, txType: $txType, groupTokenId: $groupTokenId, isInvalid: $isInvalid, burnSummary: $burnSummary, failedColorings: $failedColorings, actualBurnAtoms: $actualBurnAtoms, intentionalBurnAtoms: $intentionalBurnAtoms, burnsMintBatons: $burnsMintBatons)';
}


}

/// @nodoc
abstract mixin class $TokenEntryCopyWith<$Res>  {
  factory $TokenEntryCopyWith(TokenEntry value, $Res Function(TokenEntry) _then) = _$TokenEntryCopyWithImpl;
@useResult
$Res call({
 String tokenId, Object tokenType, TokenTxType txType, bool isInvalid, String burnSummary, List<TokenFailedColoring> failedColorings, BigInt actualBurnAtoms, BigInt intentionalBurnAtoms, bool burnsMintBatons, String? groupTokenId
});




}
/// @nodoc
class _$TokenEntryCopyWithImpl<$Res>
    implements $TokenEntryCopyWith<$Res> {
  _$TokenEntryCopyWithImpl(this._self, this._then);

  final TokenEntry _self;
  final $Res Function(TokenEntry) _then;

/// Create a copy of TokenEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? tokenType = null,Object? txType = null,Object? isInvalid = null,Object? burnSummary = null,Object? failedColorings = null,Object? actualBurnAtoms = null,Object? intentionalBurnAtoms = null,Object? burnsMintBatons = null,Object? groupTokenId = freezed,}) {
  return _then(TokenEntry(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType ,txType: null == txType ? _self.txType : txType // ignore: cast_nullable_to_non_nullable
as TokenTxType,isInvalid: null == isInvalid ? _self.isInvalid : isInvalid // ignore: cast_nullable_to_non_nullable
as bool,burnSummary: null == burnSummary ? _self.burnSummary : burnSummary // ignore: cast_nullable_to_non_nullable
as String,failedColorings: null == failedColorings ? _self.failedColorings : failedColorings // ignore: cast_nullable_to_non_nullable
as List<TokenFailedColoring>,actualBurnAtoms: null == actualBurnAtoms ? _self.actualBurnAtoms : actualBurnAtoms // ignore: cast_nullable_to_non_nullable
as BigInt,intentionalBurnAtoms: null == intentionalBurnAtoms ? _self.intentionalBurnAtoms : intentionalBurnAtoms // ignore: cast_nullable_to_non_nullable
as BigInt,burnsMintBatons: null == burnsMintBatons ? _self.burnsMintBatons : burnsMintBatons // ignore: cast_nullable_to_non_nullable
as bool,groupTokenId: freezed == groupTokenId ? _self.groupTokenId : groupTokenId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenEntry].
extension TokenEntryPatterns on TokenEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$PluginEntry {

 List<String> get groups; List<String> get data;
/// Create a copy of PluginEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PluginEntryCopyWith<PluginEntry> get copyWith => _$PluginEntryCopyWithImpl<PluginEntry>(this as PluginEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PluginEntry&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PluginEntry(groups: $groups, data: $data)';
}


}

/// @nodoc
abstract mixin class $PluginEntryCopyWith<$Res>  {
  factory $PluginEntryCopyWith(PluginEntry value, $Res Function(PluginEntry) _then) = _$PluginEntryCopyWithImpl;
@useResult
$Res call({
 List<String> groups, List<String> data
});




}
/// @nodoc
class _$PluginEntryCopyWithImpl<$Res>
    implements $PluginEntryCopyWith<$Res> {
  _$PluginEntryCopyWithImpl(this._self, this._then);

  final PluginEntry _self;
  final $Res Function(PluginEntry) _then;

/// Create a copy of PluginEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? data = null,}) {
  return _then(PluginEntry(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<String>,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PluginEntry].
extension PluginEntryPatterns on PluginEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$BlockMetadata {

 int get height; String get hash; int get timestamp;
/// Create a copy of BlockMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockMetadataCopyWith<BlockMetadata> get copyWith => _$BlockMetadataCopyWithImpl<BlockMetadata>(this as BlockMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockMetadata&&(identical(other.height, height) || other.height == height)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,height,hash,timestamp);

@override
String toString() {
  return 'BlockMetadata(height: $height, hash: $hash, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $BlockMetadataCopyWith<$Res>  {
  factory $BlockMetadataCopyWith(BlockMetadata value, $Res Function(BlockMetadata) _then) = _$BlockMetadataCopyWithImpl;
@useResult
$Res call({
 int height, String hash, int timestamp
});




}
/// @nodoc
class _$BlockMetadataCopyWithImpl<$Res>
    implements $BlockMetadataCopyWith<$Res> {
  _$BlockMetadataCopyWithImpl(this._self, this._then);

  final BlockMetadata _self;
  final $Res Function(BlockMetadata) _then;

/// Create a copy of BlockMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? height = null,Object? hash = null,Object? timestamp = null,}) {
  return _then(BlockMetadata(
height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockMetadata].
extension BlockMetadataPatterns on BlockMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TxInput {

 OutPoint get prevOut; String get inputScript; String? get outputScript; BigInt get sats; int get sequenceNo; Token? get token; PluginEntries? get plugins;
/// Create a copy of TxInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxInputCopyWith<TxInput> get copyWith => _$TxInputCopyWithImpl<TxInput>(this as TxInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxInput&&(identical(other.prevOut, prevOut) || other.prevOut == prevOut)&&(identical(other.inputScript, inputScript) || other.inputScript == inputScript)&&(identical(other.outputScript, outputScript) || other.outputScript == outputScript)&&(identical(other.sats, sats) || other.sats == sats)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.plugins, plugins));
}


@override
int get hashCode => Object.hash(runtimeType,prevOut,inputScript,outputScript,sats,sequenceNo,token,const DeepCollectionEquality().hash(plugins));

@override
String toString() {
  return 'TxInput(prevOut: $prevOut, inputScript: $inputScript, outputScript: $outputScript, sats: $sats, sequenceNo: $sequenceNo, token: $token, plugins: $plugins)';
}


}

/// @nodoc
abstract mixin class $TxInputCopyWith<$Res>  {
  factory $TxInputCopyWith(TxInput value, $Res Function(TxInput) _then) = _$TxInputCopyWithImpl;
@useResult
$Res call({
 OutPoint prevOut, String inputScript, BigInt sats, int sequenceNo, String? outputScript, Token? token, Map<String, PluginEntry>? plugins
});




}
/// @nodoc
class _$TxInputCopyWithImpl<$Res>
    implements $TxInputCopyWith<$Res> {
  _$TxInputCopyWithImpl(this._self, this._then);

  final TxInput _self;
  final $Res Function(TxInput) _then;

/// Create a copy of TxInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prevOut = null,Object? inputScript = null,Object? sats = null,Object? sequenceNo = null,Object? outputScript = freezed,Object? token = freezed,Object? plugins = freezed,}) {
  return _then(TxInput(
prevOut: null == prevOut ? _self.prevOut : prevOut // ignore: cast_nullable_to_non_nullable
as OutPoint,inputScript: null == inputScript ? _self.inputScript : inputScript // ignore: cast_nullable_to_non_nullable
as String,sats: null == sats ? _self.sats : sats // ignore: cast_nullable_to_non_nullable
as BigInt,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,outputScript: freezed == outputScript ? _self.outputScript : outputScript // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as Token?,plugins: freezed == plugins ? _self.plugins : plugins // ignore: cast_nullable_to_non_nullable
as Map<String, PluginEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TxInput].
extension TxInputPatterns on TxInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TxOutput {

 BigInt get sats; String get outputScript; OutPoint? get spentBy; Token? get token; PluginEntries? get plugins;
/// Create a copy of TxOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxOutputCopyWith<TxOutput> get copyWith => _$TxOutputCopyWithImpl<TxOutput>(this as TxOutput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxOutput&&(identical(other.sats, sats) || other.sats == sats)&&(identical(other.outputScript, outputScript) || other.outputScript == outputScript)&&(identical(other.spentBy, spentBy) || other.spentBy == spentBy)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.plugins, plugins));
}


@override
int get hashCode => Object.hash(runtimeType,sats,outputScript,spentBy,token,const DeepCollectionEquality().hash(plugins));

@override
String toString() {
  return 'TxOutput(sats: $sats, outputScript: $outputScript, spentBy: $spentBy, token: $token, plugins: $plugins)';
}


}

/// @nodoc
abstract mixin class $TxOutputCopyWith<$Res>  {
  factory $TxOutputCopyWith(TxOutput value, $Res Function(TxOutput) _then) = _$TxOutputCopyWithImpl;
@useResult
$Res call({
 BigInt sats, String outputScript, OutPoint? spentBy, Token? token, Map<String, PluginEntry>? plugins
});




}
/// @nodoc
class _$TxOutputCopyWithImpl<$Res>
    implements $TxOutputCopyWith<$Res> {
  _$TxOutputCopyWithImpl(this._self, this._then);

  final TxOutput _self;
  final $Res Function(TxOutput) _then;

/// Create a copy of TxOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sats = null,Object? outputScript = null,Object? spentBy = freezed,Object? token = freezed,Object? plugins = freezed,}) {
  return _then(TxOutput(
sats: null == sats ? _self.sats : sats // ignore: cast_nullable_to_non_nullable
as BigInt,outputScript: null == outputScript ? _self.outputScript : outputScript // ignore: cast_nullable_to_non_nullable
as String,spentBy: freezed == spentBy ? _self.spentBy : spentBy // ignore: cast_nullable_to_non_nullable
as OutPoint?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as Token?,plugins: freezed == plugins ? _self.plugins : plugins // ignore: cast_nullable_to_non_nullable
as Map<String, PluginEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TxOutput].
extension TxOutputPatterns on TxOutput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$ScriptUtxo {

 OutPoint get outpoint; int get blockHeight; bool get isCoinbase; BigInt get sats; bool get isFinal; Token? get token; PluginEntries? get plugins;
/// Create a copy of ScriptUtxo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScriptUtxoCopyWith<ScriptUtxo> get copyWith => _$ScriptUtxoCopyWithImpl<ScriptUtxo>(this as ScriptUtxo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScriptUtxo&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.blockHeight, blockHeight) || other.blockHeight == blockHeight)&&(identical(other.isCoinbase, isCoinbase) || other.isCoinbase == isCoinbase)&&(identical(other.sats, sats) || other.sats == sats)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.plugins, plugins));
}


@override
int get hashCode => Object.hash(runtimeType,outpoint,blockHeight,isCoinbase,sats,isFinal,token,const DeepCollectionEquality().hash(plugins));

@override
String toString() {
  return 'ScriptUtxo(outpoint: $outpoint, blockHeight: $blockHeight, isCoinbase: $isCoinbase, sats: $sats, isFinal: $isFinal, token: $token, plugins: $plugins)';
}


}

/// @nodoc
abstract mixin class $ScriptUtxoCopyWith<$Res>  {
  factory $ScriptUtxoCopyWith(ScriptUtxo value, $Res Function(ScriptUtxo) _then) = _$ScriptUtxoCopyWithImpl;
@useResult
$Res call({
 OutPoint outpoint, int blockHeight, bool isCoinbase, BigInt sats, bool isFinal, Token? token, Map<String, PluginEntry>? plugins
});




}
/// @nodoc
class _$ScriptUtxoCopyWithImpl<$Res>
    implements $ScriptUtxoCopyWith<$Res> {
  _$ScriptUtxoCopyWithImpl(this._self, this._then);

  final ScriptUtxo _self;
  final $Res Function(ScriptUtxo) _then;

/// Create a copy of ScriptUtxo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outpoint = null,Object? blockHeight = null,Object? isCoinbase = null,Object? sats = null,Object? isFinal = null,Object? token = freezed,Object? plugins = freezed,}) {
  return _then(ScriptUtxo(
outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as OutPoint,blockHeight: null == blockHeight ? _self.blockHeight : blockHeight // ignore: cast_nullable_to_non_nullable
as int,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,sats: null == sats ? _self.sats : sats // ignore: cast_nullable_to_non_nullable
as BigInt,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as Token?,plugins: freezed == plugins ? _self.plugins : plugins // ignore: cast_nullable_to_non_nullable
as Map<String, PluginEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScriptUtxo].
extension ScriptUtxoPatterns on ScriptUtxo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$Tx {

 String get txid; int get version; List<TxInput> get inputs; List<TxOutput> get outputs; int get lockTime; BlockMetadata? get block; int get timeFirstSeen; int get size; bool get isCoinbase; List<TokenEntry> get tokenEntries; List<TokenFailedParsing> get tokenFailedParsings; TokenStatus get tokenStatus; bool get isFinal;
/// Create a copy of Tx
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxCopyWith<Tx> get copyWith => _$TxCopyWithImpl<Tx>(this as Tx, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tx&&(identical(other.txid, txid) || other.txid == txid)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.inputs, inputs)&&const DeepCollectionEquality().equals(other.outputs, outputs)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&(identical(other.block, block) || other.block == block)&&(identical(other.timeFirstSeen, timeFirstSeen) || other.timeFirstSeen == timeFirstSeen)&&(identical(other.size, size) || other.size == size)&&(identical(other.isCoinbase, isCoinbase) || other.isCoinbase == isCoinbase)&&const DeepCollectionEquality().equals(other.tokenEntries, tokenEntries)&&const DeepCollectionEquality().equals(other.tokenFailedParsings, tokenFailedParsings)&&(identical(other.tokenStatus, tokenStatus) || other.tokenStatus == tokenStatus)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal));
}


@override
int get hashCode => Object.hash(runtimeType,txid,version,const DeepCollectionEquality().hash(inputs),const DeepCollectionEquality().hash(outputs),lockTime,block,timeFirstSeen,size,isCoinbase,const DeepCollectionEquality().hash(tokenEntries),const DeepCollectionEquality().hash(tokenFailedParsings),tokenStatus,isFinal);

@override
String toString() {
  return 'Tx(txid: $txid, version: $version, inputs: $inputs, outputs: $outputs, lockTime: $lockTime, block: $block, timeFirstSeen: $timeFirstSeen, size: $size, isCoinbase: $isCoinbase, tokenEntries: $tokenEntries, tokenFailedParsings: $tokenFailedParsings, tokenStatus: $tokenStatus, isFinal: $isFinal)';
}


}

/// @nodoc
abstract mixin class $TxCopyWith<$Res>  {
  factory $TxCopyWith(Tx value, $Res Function(Tx) _then) = _$TxCopyWithImpl;
@useResult
$Res call({
 String txid, int version, List<TxInput> inputs, List<TxOutput> outputs, int lockTime, int timeFirstSeen, int size, bool isCoinbase, List<TokenEntry> tokenEntries, List<TokenFailedParsing> tokenFailedParsings, TokenStatus tokenStatus, bool isFinal, BlockMetadata? block
});




}
/// @nodoc
class _$TxCopyWithImpl<$Res>
    implements $TxCopyWith<$Res> {
  _$TxCopyWithImpl(this._self, this._then);

  final Tx _self;
  final $Res Function(Tx) _then;

/// Create a copy of Tx
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? txid = null,Object? version = null,Object? inputs = null,Object? outputs = null,Object? lockTime = null,Object? timeFirstSeen = null,Object? size = null,Object? isCoinbase = null,Object? tokenEntries = null,Object? tokenFailedParsings = null,Object? tokenStatus = null,Object? isFinal = null,Object? block = freezed,}) {
  return _then(Tx(
txid: null == txid ? _self.txid : txid // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<TxInput>,outputs: null == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<TxOutput>,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as int,timeFirstSeen: null == timeFirstSeen ? _self.timeFirstSeen : timeFirstSeen // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,tokenEntries: null == tokenEntries ? _self.tokenEntries : tokenEntries // ignore: cast_nullable_to_non_nullable
as List<TokenEntry>,tokenFailedParsings: null == tokenFailedParsings ? _self.tokenFailedParsings : tokenFailedParsings // ignore: cast_nullable_to_non_nullable
as List<TokenFailedParsing>,tokenStatus: null == tokenStatus ? _self.tokenStatus : tokenStatus // ignore: cast_nullable_to_non_nullable
as TokenStatus,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as BlockMetadata?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tx].
extension TxPatterns on Tx {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$RawTx {

 String get rawTx;
/// Create a copy of RawTx
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawTxCopyWith<RawTx> get copyWith => _$RawTxCopyWithImpl<RawTx>(this as RawTx, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawTx&&(identical(other.rawTx, rawTx) || other.rawTx == rawTx));
}


@override
int get hashCode => Object.hash(runtimeType,rawTx);

@override
String toString() {
  return 'RawTx(rawTx: $rawTx)';
}


}

/// @nodoc
abstract mixin class $RawTxCopyWith<$Res>  {
  factory $RawTxCopyWith(RawTx value, $Res Function(RawTx) _then) = _$RawTxCopyWithImpl;
@useResult
$Res call({
 String rawTx
});




}
/// @nodoc
class _$RawTxCopyWithImpl<$Res>
    implements $RawTxCopyWith<$Res> {
  _$RawTxCopyWithImpl(this._self, this._then);

  final RawTx _self;
  final $Res Function(RawTx) _then;

/// Create a copy of RawTx
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawTx = null,}) {
  return _then(RawTx(
rawTx: null == rawTx ? _self.rawTx : rawTx // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RawTx].
extension RawTxPatterns on RawTx {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$Utxo {

 OutPoint get outpoint; int get blockHeight; bool get isCoinbase; Int64 get sats; String get script; bool get isFinal; Token? get token; PluginEntries? get plugins;
/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtxoCopyWith<Utxo> get copyWith => _$UtxoCopyWithImpl<Utxo>(this as Utxo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Utxo&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.blockHeight, blockHeight) || other.blockHeight == blockHeight)&&(identical(other.isCoinbase, isCoinbase) || other.isCoinbase == isCoinbase)&&(identical(other.sats, sats) || other.sats == sats)&&(identical(other.script, script) || other.script == script)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal)&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.plugins, plugins));
}


@override
int get hashCode => Object.hash(runtimeType,outpoint,blockHeight,isCoinbase,sats,script,isFinal,token,const DeepCollectionEquality().hash(plugins));

@override
String toString() {
  return 'Utxo(outpoint: $outpoint, blockHeight: $blockHeight, isCoinbase: $isCoinbase, sats: $sats, script: $script, isFinal: $isFinal, token: $token, plugins: $plugins)';
}


}

/// @nodoc
abstract mixin class $UtxoCopyWith<$Res>  {
  factory $UtxoCopyWith(Utxo value, $Res Function(Utxo) _then) = _$UtxoCopyWithImpl;
@useResult
$Res call({
 OutPoint outpoint, int blockHeight, bool isCoinbase, Int64 sats, String script, bool isFinal, Token? token, Map<String, PluginEntry>? plugins
});




}
/// @nodoc
class _$UtxoCopyWithImpl<$Res>
    implements $UtxoCopyWith<$Res> {
  _$UtxoCopyWithImpl(this._self, this._then);

  final Utxo _self;
  final $Res Function(Utxo) _then;

/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outpoint = null,Object? blockHeight = null,Object? isCoinbase = null,Object? sats = null,Object? script = null,Object? isFinal = null,Object? token = freezed,Object? plugins = freezed,}) {
  return _then(Utxo(
outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as OutPoint,blockHeight: null == blockHeight ? _self.blockHeight : blockHeight // ignore: cast_nullable_to_non_nullable
as int,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,sats: null == sats ? _self.sats : sats // ignore: cast_nullable_to_non_nullable
as Int64,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as Token?,plugins: freezed == plugins ? _self.plugins : plugins // ignore: cast_nullable_to_non_nullable
as Map<String, PluginEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Utxo].
extension UtxoPatterns on Utxo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
