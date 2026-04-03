

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _db;

  AppDatabase._init();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('app.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Category (
      categoryId TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      parentCategoryId TEXT NOT NULL
    );
  ''');

    await db.execute('''
    CREATE TABLE Certificates (
      certId TEXT NOT NULL PRIMARY KEY,
      studentId TEXT,
      courseId TEXT,
      issueDate TEXT,
      criteria TEXT,
      FOREIGN KEY (courseId) REFERENCES Courses(courseId),
      FOREIGN KEY (studentId) REFERENCES Student(studentId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Courses (
      courseId TEXT NOT NULL PRIMARY KEY,
      instructorId TEXT,
      categoryId TEXT,
      title TEXT DEFAULT '',
      description TEXT DEFAULT '',
      price REAL DEFAULT 0,
      status TEXT,
      url TEXT NOT NULL DEFAULT '',
      thumbnail TEXT DEFAULT '',
      instructorName TEXT
    );
  ''');

    await db.execute('''
    CREATE TABLE Enrollements (
      enrollmentId TEXT NOT NULL PRIMARY KEY,
      studentId TEXT,
      courseId TEXT NOT NULL,
      enrollmentDate TEXT,
      progress REAL,
      status TEXT,
      FOREIGN KEY (courseId) REFERENCES Courses(courseId) ON DELETE SET NULL,
      FOREIGN KEY (studentId) REFERENCES Student(studentId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Instructors (
      instructorId TEXT NOT NULL PRIMARY KEY,
      userId TEXT,
      bio TEXT,
      qualifications TEXT,
      rating REAL
    );
  ''');

    await db.execute('''
    CREATE TABLE Lesson (
      lessonId TEXT NOT NULL PRIMARY KEY,
      sectionId TEXT,
      title TEXT DEFAULT '',
      content TEXT DEFAULT '',
      videoUrl TEXT DEFAULT '',
      duration INTEGER
    );
  ''');

    await db.execute('''
    CREATE TABLE Notifications (
      notifId TEXT NOT NULL PRIMARY KEY,
      userId TEXT,
      message TEXT,
      isRead INTEGER,
      FOREIGN KEY (userId) REFERENCES User(userId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Payments (
      paymentId TEXT NOT NULL PRIMARY KEY,
      enrollmentId TEXT,
      amount REAL,
      date TEXT,
      status TEXT,
      method TEXT,
      FOREIGN KEY (enrollmentId) REFERENCES Enrollements(enrollmentId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Posts (
      postId TEXT NOT NULL PRIMARY KEY,
      forumId TEXT,
      authorId TEXT,
      content TEXT,
      date TEXT,
      FOREIGN KEY (authorId) REFERENCES User(userId),
      FOREIGN KEY (forumId) REFERENCES Forum(forumId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Questions (
      questionId TEXT NOT NULL PRIMARY KEY,
      quizId TEXT,
      text TEXT,
      options TEXT,
      correctAnswer TEXT,
      FOREIGN KEY (quizId) REFERENCES Quizzes(quizId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Quizzes (
      quizId TEXT NOT NULL PRIMARY KEY,
      courseId TEXT,
      title TEXT,
      passingGrade INTEGER,
      FOREIGN KEY (courseId) REFERENCES Courses(courseId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Review (
      reviewId TEXT NOT NULL PRIMARY KEY,
      courseId TEXT,
      studentId TEXT,
      rating INTEGER,
      comment TEXT,
      date TEXT,
      FOREIGN KEY (studentId) REFERENCES Student(studentId)
    );
  ''');

    await db.execute('''
    CREATE TABLE Sections (
      sectionId TEXT NOT NULL PRIMARY KEY,
      courseId TEXT,
      title TEXT,
      "order" INTEGER
    );
  ''');

    await db.execute('''
    CREATE TABLE Student (
      studentId TEXT NOT NULL PRIMARY KEY,
      enrolledCourses TEXT,
      progress TEXT,
      userId INTEGER
    );
  ''');

    await db.execute('''
    CREATE TABLE User (
      userId TEXT NOT NULL PRIMARY KEY,
      name TEXT,
      email TEXT,
      passwordHash TEXT,
      role TEXT
    );
  ''');
  }

}
