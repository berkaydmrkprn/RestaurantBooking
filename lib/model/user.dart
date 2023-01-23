

class UserModel {
  UserModel(
      {required this.username,
      required this.email,
      required this.password,
      
      this.admin = false});
  String username;
  String email;
  String password;
  
  bool admin;

  factory UserModel.fromJson(json) => UserModel(
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      admin: json["admin"] ?? false);

  toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "admin": admin
    };
  }
}

class DateModel{
  DateModel(
    
      {required this.date,
      
      
      this.admin = false});

     String date;
     
  
  
  bool admin;

  factory DateModel.fromJson(json) => DateModel(
     date: json["date"] ?? "",
      
     
      admin: json["admin"] ?? false);

  

  toJson() {
    return {
      "date": date,
      
     
      "admin": admin
    };
  }


}

class MasaModel{

  MasaModel({

    required this.Masa

  });

  String Masa;
  factory MasaModel.fromJson(json)=>MasaModel(

    
    Masa:json["masa"]??"");
  
  toJson(){

    return{
      "masa":Masa
    };
  }

}

class RateModel{
  RateModel(
    
    {required this.rate}
  
  );

  String rate;
  factory RateModel.fromJson(json)=>RateModel(rate: json["Rate"]??"");
  toJson(){

    return{
      "Rate":rate
    };
  }
}


class TimeModel{
    TimeModel(

      {required this.time}


    );

    String time;

factory TimeModel.fromJson(json)=> TimeModel(
  
    time:json["time"] ?? "");

toJson(){

  

  return{

      "time":time

  };

}

}
