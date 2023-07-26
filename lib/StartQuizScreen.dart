import 'package:flutter/material.dart';
import 'package:flutter_application_1/sqlDb.dart';
import 'Answer.dart';
import 'NotEnoughQuestions.dart';
import 'ResultSucsses.dart';
import 'ResultfailScreen.dart';

class StartQuiz extends StatefulWidget {
  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  int score = 0;
  int currentIndex = 0;
  final SqlDb sqlDb = SqlDb();
  PageController pageController = PageController(initialPage: 0);
  String query = 'SELECT * FROM AddQuestions';
  Future<List<Map<String, dynamic>>> fetchData() async {
    return await sqlDb.readData(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data!.length >= 5) {
              return PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final currentQuestion = snapshot.data[index];
                  final questionText = currentQuestion[SqlDb.COL_QUESTION_TEXT];
                  final option1 = currentQuestion[SqlDb.COL_ANSWER_OPTIONS1];
                  final option2 = currentQuestion[SqlDb.COL_ANSWER_OPTIONS2];
                  final option3 = currentQuestion[SqlDb.COL_ANSWER_OPTIONS3];
                  final option4 = currentQuestion[SqlDb.COL_ANSWER_OPTIONS4];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Question ${index + 1}',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '/ ${snapshot.data.length}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal,
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            questionText,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Answer(
                        answer: option1,
                        function: () {
                          if (option1 == currentQuestion[SqlDb.COL_CORRECT_ANSWER]) {
                            setState(() {
                              score++;
                            });
                          }
                          if (currentIndex == snapshot.data.length - 1) {
                            if (score >= currentIndex / 2) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultSucsses(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultfailScreen(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            }
                          }
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      Answer(
                        answer: option2,
                        function: () {
                          if (option2 == currentQuestion[SqlDb.COL_CORRECT_ANSWER]) {
                            setState(() {
                              score++;
                            });
                          }
                          if (currentIndex == snapshot.data.length - 1) {
                            if (score >= currentIndex / 2) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultSucsses(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultfailScreen(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            }
                          }
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      Answer(
                        answer: option3,
                        function: () {
                          if (option3 == currentQuestion[SqlDb.COL_CORRECT_ANSWER]) {
                            setState(() {
                              score++;
                            });
                          }
                          if (currentIndex == snapshot.data.length - 1) {
                            if (score >= currentIndex / 2) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultSucsses(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultfailScreen(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            }
                          }
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      Answer(
                        answer: option4,
                        function: () {
                          if (option4 == currentQuestion[SqlDb.COL_CORRECT_ANSWER]) {
                            setState(() {
                              score++;
                            });
                          }
                          if (currentIndex == snapshot.data.length - 1) {
                            if (score >= currentIndex / 2) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultSucsses(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ResultfailScreen(
                                    score: score,
                                    totalQuestions: snapshot.data.length,
                                  ),
                                ),
                              );
                            }
                          }
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasData) {
              return NotEnoughQuestions();
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.teal),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
