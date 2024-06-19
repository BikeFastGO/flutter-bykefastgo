// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bicycleDto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBicycleDtoCollection on Isar {
  IsarCollection<BicycleDto> get bicycleDtos => this.collection();
}

const BicycleDtoSchema = CollectionSchema(
  name: r'BicycleDto',
  id: -2767912424467358212,
  properties: {
    r'bicycleDescription': PropertySchema(
      id: 0,
      name: r'bicycleDescription',
      type: IsarType.string,
    ),
    r'bicycleId': PropertySchema(
      id: 1,
      name: r'bicycleId',
      type: IsarType.long,
    ),
    r'bicycleModel': PropertySchema(
      id: 2,
      name: r'bicycleModel',
      type: IsarType.string,
    ),
    r'bicycleName': PropertySchema(
      id: 3,
      name: r'bicycleName',
      type: IsarType.string,
    ),
    r'bicyclePrice': PropertySchema(
      id: 4,
      name: r'bicyclePrice',
      type: IsarType.double,
    ),
    r'bicycleSize': PropertySchema(
      id: 5,
      name: r'bicycleSize',
      type: IsarType.string,
    ),
    r'imageData': PropertySchema(
      id: 6,
      name: r'imageData',
      type: IsarType.string,
    ),
    r'latitudeData': PropertySchema(
      id: 7,
      name: r'latitudeData',
      type: IsarType.double,
    ),
    r'longitudeData': PropertySchema(
      id: 8,
      name: r'longitudeData',
      type: IsarType.double,
    )
  },
  estimateSize: _bicycleDtoEstimateSize,
  serialize: _bicycleDtoSerialize,
  deserialize: _bicycleDtoDeserialize,
  deserializeProp: _bicycleDtoDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bicycleDtoGetId,
  getLinks: _bicycleDtoGetLinks,
  attach: _bicycleDtoAttach,
  version: '3.1.0+1',
);

int _bicycleDtoEstimateSize(
  BicycleDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bicycleDescription.length * 3;
  bytesCount += 3 + object.bicycleModel.length * 3;
  bytesCount += 3 + object.bicycleName.length * 3;
  bytesCount += 3 + object.bicycleSize.length * 3;
  bytesCount += 3 + object.imageData.length * 3;
  return bytesCount;
}

void _bicycleDtoSerialize(
  BicycleDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bicycleDescription);
  writer.writeLong(offsets[1], object.bicycleId);
  writer.writeString(offsets[2], object.bicycleModel);
  writer.writeString(offsets[3], object.bicycleName);
  writer.writeDouble(offsets[4], object.bicyclePrice);
  writer.writeString(offsets[5], object.bicycleSize);
  writer.writeString(offsets[6], object.imageData);
  writer.writeDouble(offsets[7], object.latitudeData);
  writer.writeDouble(offsets[8], object.longitudeData);
}

BicycleDto _bicycleDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BicycleDto(
    bicycleDescription: reader.readString(offsets[0]),
    bicycleId: reader.readLong(offsets[1]),
    bicycleModel: reader.readString(offsets[2]),
    bicycleName: reader.readString(offsets[3]),
    bicyclePrice: reader.readDouble(offsets[4]),
    bicycleSize: reader.readString(offsets[5]),
    imageData: reader.readString(offsets[6]),
    latitudeData: reader.readDouble(offsets[7]),
    longitudeData: reader.readDouble(offsets[8]),
  );
  object.isarId = id;
  return object;
}

P _bicycleDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bicycleDtoGetId(BicycleDto object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _bicycleDtoGetLinks(BicycleDto object) {
  return [];
}

void _bicycleDtoAttach(IsarCollection<dynamic> col, Id id, BicycleDto object) {
  object.isarId = id;
}

extension BicycleDtoQueryWhereSort
    on QueryBuilder<BicycleDto, BicycleDto, QWhere> {
  QueryBuilder<BicycleDto, BicycleDto, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BicycleDtoQueryWhere
    on QueryBuilder<BicycleDto, BicycleDto, QWhereClause> {
  QueryBuilder<BicycleDto, BicycleDto, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BicycleDtoQueryFilter
    on QueryBuilder<BicycleDto, BicycleDto, QFilterCondition> {
  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bicycleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bicycleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bicycleDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bicycleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bicycleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bicycleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bicycleDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bicycleDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> bicycleIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleId',
        value: value,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bicycleId',
        value: value,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> bicycleIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bicycleId',
        value: value,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> bicycleIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bicycleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bicycleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bicycleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bicycleModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bicycleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bicycleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bicycleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bicycleModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleModel',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bicycleModel',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bicycleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bicycleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bicycleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bicycleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bicycleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bicycleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bicycleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleName',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bicycleName',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicyclePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicyclePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicyclePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bicyclePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicyclePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bicyclePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicyclePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bicyclePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bicycleSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bicycleSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bicycleSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bicycleSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bicycleSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bicycleSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bicycleSize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bicycleSize',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      bicycleSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bicycleSize',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> imageDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      imageDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> imageDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> imageDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      imageDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> imageDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> imageDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> imageDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      imageDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageData',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      imageDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageData',
        value: '',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      latitudeDataEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitudeData',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      latitudeDataGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitudeData',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      latitudeDataLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitudeData',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      latitudeDataBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitudeData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      longitudeDataEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitudeData',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      longitudeDataGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitudeData',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      longitudeDataLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitudeData',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterFilterCondition>
      longitudeDataBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitudeData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BicycleDtoQueryObject
    on QueryBuilder<BicycleDto, BicycleDto, QFilterCondition> {}

extension BicycleDtoQueryLinks
    on QueryBuilder<BicycleDto, BicycleDto, QFilterCondition> {}

extension BicycleDtoQuerySortBy
    on QueryBuilder<BicycleDto, BicycleDto, QSortBy> {
  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy>
      sortByBicycleDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleDescription', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy>
      sortByBicycleDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleDescription', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleId', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleId', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleModel', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleModel', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleName', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleName', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicyclePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicyclePrice', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicyclePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicyclePrice', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleSize', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByBicycleSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleSize', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByImageData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageData', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByImageDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageData', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByLatitudeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitudeData', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByLatitudeDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitudeData', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByLongitudeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitudeData', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> sortByLongitudeDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitudeData', Sort.desc);
    });
  }
}

extension BicycleDtoQuerySortThenBy
    on QueryBuilder<BicycleDto, BicycleDto, QSortThenBy> {
  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy>
      thenByBicycleDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleDescription', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy>
      thenByBicycleDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleDescription', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleId', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleId', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleModel', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleModel', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleName', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleName', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicyclePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicyclePrice', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicyclePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicyclePrice', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleSize', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByBicycleSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bicycleSize', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByImageData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageData', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByImageDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageData', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByLatitudeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitudeData', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByLatitudeDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitudeData', Sort.desc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByLongitudeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitudeData', Sort.asc);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QAfterSortBy> thenByLongitudeDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitudeData', Sort.desc);
    });
  }
}

extension BicycleDtoQueryWhereDistinct
    on QueryBuilder<BicycleDto, BicycleDto, QDistinct> {
  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByBicycleDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bicycleDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByBicycleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bicycleId');
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByBicycleModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bicycleModel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByBicycleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bicycleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByBicyclePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bicyclePrice');
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByBicycleSize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bicycleSize', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByImageData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByLatitudeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitudeData');
    });
  }

  QueryBuilder<BicycleDto, BicycleDto, QDistinct> distinctByLongitudeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitudeData');
    });
  }
}

extension BicycleDtoQueryProperty
    on QueryBuilder<BicycleDto, BicycleDto, QQueryProperty> {
  QueryBuilder<BicycleDto, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<BicycleDto, String, QQueryOperations>
      bicycleDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bicycleDescription');
    });
  }

  QueryBuilder<BicycleDto, int, QQueryOperations> bicycleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bicycleId');
    });
  }

  QueryBuilder<BicycleDto, String, QQueryOperations> bicycleModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bicycleModel');
    });
  }

  QueryBuilder<BicycleDto, String, QQueryOperations> bicycleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bicycleName');
    });
  }

  QueryBuilder<BicycleDto, double, QQueryOperations> bicyclePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bicyclePrice');
    });
  }

  QueryBuilder<BicycleDto, String, QQueryOperations> bicycleSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bicycleSize');
    });
  }

  QueryBuilder<BicycleDto, String, QQueryOperations> imageDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageData');
    });
  }

  QueryBuilder<BicycleDto, double, QQueryOperations> latitudeDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitudeData');
    });
  }

  QueryBuilder<BicycleDto, double, QQueryOperations> longitudeDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitudeData');
    });
  }
}
