
class Message{

  String name;
  String time;
  bool isSending;

  Message({required this.name,required this.isSending,required this.time});

  // convert it to map
  Map<String ,dynamic> toJson(){
    return {
      'name':name,
      'time':time,
      'isSending':isSending
    };
  }

  // // convert string into object again
  // Message fromJson(Map<String ,dynamic> map){
  //   return Message(name: map['name'], isSending: map['time'], time: map['isSending']);
  // }

}