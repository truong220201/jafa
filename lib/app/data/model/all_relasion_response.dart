import 'user.dart';

class AllRelationResponse {
  final User? dad;
  final List<User>? wivesOfDad;
  final List<User>? siblings;
  final List<User>? couple;
  final List<User>? children;
  final List<User>? others;

  AllRelationResponse(this.dad, this.wivesOfDad, this.siblings, this.couple,
      this.children, this.others);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dad': dad?.toJson(),
      'wivesOfDad': wivesOfDad?.map((x) => x.toJson()).toList(),
      'siblings': siblings?.map((x) => x.toJson()).toList(),
      'couple': couple?.map((x) => x.toJson()).toList(),
      'children': children?.map((x) => x.toJson()).toList(),
      'others': others?.map((x) => x.toJson()).toList(),
    };
  }

  factory AllRelationResponse.fromJson(Map<String, dynamic> map) {
    return AllRelationResponse(
      map['dad'] != null && map['dad'].toString() != "[]"
          ? User.fromJson(map['dad'] as Map<String, dynamic>)
          : null,
      map['wivesOfDad'] != null
          ? List<User>.from(
              map['wivesOfDad'].map<User?>(
                (x) => User.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['siblings'] != null
          ? List<User>.from(
              map['siblings'].map<User?>(
                (x) => User.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['couple'] != null
          ? List<User>.from(
              map['couple'].map<User?>(
                (x) => User.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['children'] != null
          ? List<User>.from(
              map['children'].map<User?>(
                (x) => User.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['others'] != null
          ? List<User>.from(
              map['others'].map<User?>(
                (x) => User.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
