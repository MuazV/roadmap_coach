import 'package:json_annotation/json_annotation.dart';

part 'roadmap.g.dart';

@JsonSerializable()
class Roadmap {
  final String title;
  final String description;
  final int totalWeeks;
  final List<Phase> phases;
  
  Roadmap({
    required this.title,
    required this.description,
    required this.totalWeeks,
    required this.phases,
  });
  
  factory Roadmap.fromJson(Map<String, dynamic> json) => _$RoadmapFromJson(json);
  Map<String, dynamic> toJson() => _$RoadmapToJson(this);
}

@JsonSerializable()
class Phase {
  final String id;
  final String title;
  final String description;
  final int weekStart;
  final int weekEnd;
  final String level;
  final List<Topic> topics;
  final List<String> milestones;
  
  Phase({
    required this.id,
    required this.title,
    required this.description,
    required this.weekStart,
    required this.weekEnd,
    required this.level,
    required this.topics,
    required this.milestones,
  });
  
  int get duration => weekEnd - weekStart + 1;
  
  factory Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);
  Map<String, dynamic> toJson() => _$PhaseToJson(this);
}

@JsonSerializable()
class Topic {
  final String name;
  final String description;
  final int estimatedHours;
  final List<Resource> resources;
  final bool isCompleted;
  
  Topic({
    required this.name,
    required this.description,
    required this.estimatedHours,
    required this.resources,
    this.isCompleted = false,
  });
  
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class Resource {
  final String title;
  final String url;
  final String type;
  final bool isFree;
  
  Resource({
    required this.title,
    required this.url,
    required this.type,
    this.isFree = true,
  });
  
  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}