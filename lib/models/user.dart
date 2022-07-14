

import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    this.socketId,
    this.userName,
  });

  /// The current user's scoket id.
  final String? socketId;

  /// The current user's id.
  final int id;

  /// The current user's name (display name).
  final String? userName;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: 0);

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, socketId, userName];


  // Convert a user into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'socketId': socketId,
      'userName': userName,
    };
  }

   factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      socketId: map['socketId'] as String,
      userName: map['userName'] as String,
    );
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, socketId: $socketId, userName: $userName}';
  }
}





