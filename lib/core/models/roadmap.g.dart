// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Roadmap _$RoadmapFromJson(Map<String, dynamic> json) => Roadmap(
      title: json['title'] as String,
      description: json['description'] as String,
      totalWeeks: (json['totalWeeks'] as num).toInt(),
      phases: (json['phases'] as List<dynamic>)
          .map((e) => Phase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoadmapToJson(Roadmap instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'totalWeeks': instance.totalWeeks,
      'phases': instance.phases,
    };

Phase _$PhaseFromJson(Map<String, dynamic> json) => Phase(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      weekStart: (json['weekStart'] as num).toInt(),
      weekEnd: (json['weekEnd'] as num).toInt(),
      level: json['level'] as String,
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      milestones: (json['milestones'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PhaseToJson(Phase instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'weekStart': instance.weekStart,
      'weekEnd': instance.weekEnd,
      'level': instance.level,
      'topics': instance.topics,
      'milestones': instance.milestones,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
      name: json['name'] as String,
      description: json['description'] as String,
      estimatedHours: (json['estimatedHours'] as num).toInt(),
      resources: (json['resources'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'estimatedHours': instance.estimatedHours,
      'resources': instance.resources,
      'isCompleted': instance.isCompleted,
    };

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      title: json['title'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
      isFree: json['isFree'] as bool? ?? true,
    );

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'type': instance.type,
      'isFree': instance.isFree,
    };