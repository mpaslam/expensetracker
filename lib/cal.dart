class OperationModel {
   double income;
   double expense;
   double totalbalance;
 final List<Returnvalue> returnvalue;

  // static OperationModel instance =OperationModel.getInstance();
    
  
  //   factory OperationModel.getInstance() {
    
  //   return instance;
  // }

  OperationModel(
      {this.income = 0,
      this.expense = 0,
      this.totalbalance = 0,
      required this.returnvalue});

  factory OperationModel.fromjson(Map<String, dynamic> json) {
    List<dynamic> returnjson = json['returnvalue'];
    List<Returnvalue> returnlist =
        returnjson.map((e) => Returnvalue.fromJson(e)).toList();
    return OperationModel(
        income: json['income'],
        expense: json['expense'],
        totalbalance: json['totalbalance'],
        returnvalue: returnlist);
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> returnjson =
        returnvalue.map((e) => e.goMap()).toList();
    return {
      'income': income,
      'expense': expense,
      'totalbalance': totalbalance,
      'returnvalue': returnjson
    };
  }
}

class Returnvalue {
  final double enteredincome;
  final String cat;
  final String discription;
  final String time;
  final String type;
  final String wallet;

  Returnvalue({
    required this.enteredincome,
    required this.cat,
    required this.discription,
    required this.time,
    required this.type,
    required this.wallet,
  });

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
