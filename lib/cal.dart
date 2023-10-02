class Returnvalue {
  final double enteredincome;
  final String cat;
  final String discription;
  final String time;
  final String type;
  final String wallet;

  Returnvalue(
      {required this.enteredincome,
      required this.cat,
      required this.discription,
      required this.time,
      required this.type,
      required this.wallet});

  Map<String, dynamic> goMap() {
    return {
      'discription': discription,
      'enteredincome': enteredincome,
      'time': time,
      'type': type,
      'wallet': wallet,
      'cat': cat,
    };
  }

  factory Returnvalue.fromJson(Map<String, dynamic> json) {
    return Returnvalue(
        discription: json['discription'],
        enteredincome: json['enteredincome'],
        cat: json['cat'],
        time: json['time'],
        type: json['type'],
        wallet: json['wallet']);
  }
  Map<String, dynamic> toJson() {
    return {
      'enteredincome': enteredincome,
      'cat': cat,
      'discription': discription,
      'time': time,
      'wallet': wallet,
      'type': type,
    };
  }
}
