class Api5UserModel {
  final int id;
  final int userid;
  final String title;
  final bool completed;

  Api5UserModel.json(
      {required this.id,
        required this.completed,
        required this.title,
        required this.userid});

  factory Api5UserModel.fromJson(Map<String, dynamic> json) {
    return Api5UserModel.json(
        id: json['id'],
        userid: json['userId'],
        completed: json['completed'],
        title: json['title']);
  }
}

/*
{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
*/
