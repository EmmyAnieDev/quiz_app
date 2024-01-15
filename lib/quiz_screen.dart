import 'package:quiz_app/quiz_questions_answers.dart';
import 'reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';

enum Options { previous, next, false1, true1 }

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizPage quizPage = QuizPage();
  Options selectedOption = Options.previous;
  int numCorrectAnswer = 0;
  int numFailedAnswer = 0;
  bool isButtonPressed = true; // check to see if true/false is active

  void deactivateButtons() {
    // function to deactivate button
    setState(() {
      isButtonPressed = false;
    });
  }

  void checkAnswers(bool userAnswer) {
    bool? correctAnswer = quizPage.correctAnswer();
    bool isCorrect = userAnswer == correctAnswer;

    setState(() {
      // Update the color/sound of the emojis
      if (isCorrect) {
        selectedOption = Options.true1;
        correctSound();
        numCorrectAnswer++;
      } else {
        selectedOption = Options.false1;
        inCorrectSound();
        numFailedAnswer++;
      }
    });
  }

  correctSound() async {
    final player = AudioPlayer();
    player.play(AssetSource('yay.mp3'));
  }

  inCorrectSound() async {
    final player = AudioPlayer();
    player.play(AssetSource('nay.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF9570FB),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.question_mark,
                                color: Colors.black, size: 45),
                            Text(
                              '$questionNumber',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.thumb_up_alt_outlined,
                                color: Colors.green, size: 45),
                            Text(
                              '$numCorrectAnswer',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.thumb_down_alt_outlined,
                                color: Colors.red, size: 45),
                            Text(
                              '$numFailedAnswer',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        quizPage
                            .questionContainer[questionNumber - 1].questions,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '🤗',
                        style: TextStyle(
                            fontSize: selectedOption == Options.true1 ? 35 : 30,
                            color: selectedOption == Options.true1
                                ? Colors.yellow
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '😣',
                        style: TextStyle(
                            fontSize:
                                selectedOption == Options.false1 ? 35 : 30,
                            color: selectedOption == Options.false1
                                ? Colors.red
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButtonWidget(
                      isButtonActive: isButtonPressed,
                      label: 'True',
                      color: Colors.green,
                      onPress: () {
                        setState(() {
                          selectedOption = Options.true1;
                          checkAnswers(true);
                          deactivateButtons(); // deactivate button once clicked
                        });
                      },
                    ),
                    const SizedBox(width: 20.0),
                    TextButtonWidget(
                      label: 'False',
                      color: Colors.red,
                      isButtonActive: isButtonPressed,
                      onPress: () {
                        setState(() {
                          selectedOption = Options.false1;
                          checkAnswers(false);
                          deactivateButtons(); // deactivate button once clicked
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    TextButtonWidget(
                      isButtonActive: isButtonPressed == true ? true : false,
                      color: Colors.yellow,
                      label: 'Previous',
                      onPress: () {
                        setState(() {
                          selectedOption = Options.previous;
                          if (selectedOption == Options.previous) {
                            questionNumber--; // reduce question
                            if (questionNumber < 1) {
                              questionNumber++; // stop question from reducing
                            }
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 20.0),
                    TextButtonWidget(
                      isButtonActive: true,
                      color: Colors.blue,
                      label: 'Next',
                      onPress: () {
                        setState(() {
                          selectedOption = Options.next;
                          if (selectedOption == Options.next) {
                            questionNumber++; //next question
                            if (questionNumber ==
                                quizPage.questionContainer.length + 1) {
                              questionNumber--; // stop question not to next
                              Alert(
                                context: context,
                                type: AlertType.warning,
                                title: 'Finished',
                                desc: 'you\'ve reached the end of the quiz',
                                buttons: [
                                  DialogButton(
                                    child: const Text(
                                      'RESTART',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        questionNumber = 1;
                                        numCorrectAnswer = 0;
                                        numFailedAnswer = 0;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ).show();
                            } else {
                              isButtonPressed = true;
                            }
                          }
                        });
                      },
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      questionNumber = 1; // reset questionNumber to 1
                      numFailedAnswer = 0; // reset failed answer-icon
                      numCorrectAnswer = 0; // reset correct answer-icon
                      selectedOption =
                          Options.previous; // reset check/close icons to black
                      isButtonPressed = true; // Activate the false buttons
                    });
                  },
                  icon: const Icon(
                    Icons.rotate_right,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
