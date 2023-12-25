class CoursesDetailsModel {
  String? status;
  Data? data;

  CoursesDetailsModel({this.status, this.data});

  CoursesDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? image;
  String? title;
  String? about;
  String? description;
  int? price;
  String? hours;
  Instructor? instructor;
  bool? enrolled;
  List<Lessons>? lessons;
  List<Reviews>? reviews;
  int? totalCourseRate;
  String? categoryName;

  Data(
      {this.id,
      this.image,
      this.title,
      this.about,
      this.description,
      this.price,
      this.hours,
      this.instructor,
      this.enrolled,
      this.lessons,
      this.reviews,
      this.totalCourseRate,
      this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    about = json['about'];
    description = json['description'];
    price = json['price'];
    hours = json['hours'];
    instructor = json['instructor'] != null
        ? Instructor.fromJson(json['instructor'])
        : null;
    enrolled = json['enrolled'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(Lessons.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    totalCourseRate = json['TotalCourseRate'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['about'] = about;
    data['description'] = description;
    data['price'] = price;
    data['hours'] = hours;
    if (instructor != null) {
      data['instructor'] = instructor!.toJson();
    }
    data['enrolled'] = enrolled;
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['TotalCourseRate'] = totalCourseRate;
    data['categoryName'] = categoryName;
    return data;
  }
}

class Instructor {
  int? id;
  String? name;
  String? image;

  Instructor({this.id, this.name, this.image});

  Instructor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Lessons {
  int? id;
  String? name;
  List<Videos>? videos;

  Lessons({this.id, this.name, this.videos});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  int? id;
  String? title;
  String? videoUrl;

  Videos({this.id, this.title, this.videoUrl});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['video_url'] = videoUrl;
    return data;
  }
}

class Reviews {
  int? id;
  int? rate;
  String? comment;
  Instructor? student;
  String? createAt;

  Reviews({this.id, this.rate, this.comment, this.student, this.createAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    comment = json['comment'];
    student = json['student'] != null
        ? Instructor.fromJson(json['student'])
        : null;
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate'] = rate;
    data['comment'] = comment;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    data['create_at'] = createAt;
    return data;
  }
}
