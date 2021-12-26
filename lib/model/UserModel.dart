
class UserdModel{
  String token;


  UserdModel(this.token);


  UserdModel.fromJson(Map<String ,dynamic> json):
        token = json['token']??null;

  Map<String ,dynamic> toJson() => {
    "token":this.token,

  };

}