import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable{
  final String activity;
  final String type;
  final int participants;
  final num price;
  final String link;
  final String key;
  final num accessability;

  ActivityModel({
    required this.activity, 
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessability, 
  });
  
  @override
  List<Object?> get props => [
    activity, 
    type,
    participants,
    price,
    link,
    key,
    accessability
  ];


}