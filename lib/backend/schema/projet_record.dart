import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'projet_record.g.dart';

abstract class ProjetRecord
    implements Built<ProjetRecord, ProjetRecordBuilder> {
  static Serializer<ProjetRecord> get serializer => _$projetRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'id_projet')
  int get idProjet;

  @nullable
  String get nom;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProjetRecordBuilder builder) => builder
    ..idProjet = 0
    ..nom = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projet');

  static Stream<ProjetRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProjetRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProjetRecord._();
  factory ProjetRecord([void Function(ProjetRecordBuilder) updates]) =
      _$ProjetRecord;

  static ProjetRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProjetRecordData({
  int idProjet,
  String nom,
}) =>
    serializers.toFirestore(
        ProjetRecord.serializer,
        ProjetRecord((p) => p
          ..idProjet = idProjet
          ..nom = nom));
