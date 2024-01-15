int questionNumber = 1;

class QuestionsAnswers {
  const QuestionsAnswers({required this.answers, required this.questions});

  final String questions;
  final bool answers;
}

class QuizPage {
  final List<QuestionsAnswers> questionContainer = [
    const QuestionsAnswers(
        answers: true,
        questions: '"Hot dogs", were Mickey Mouse\'s first words?'),
    const QuestionsAnswers(
        answers: false,
        questions: 'Scar was Simba\'s father in The Lion King?'),
    const QuestionsAnswers(
        answers: true, questions: 'A Spider has eight legs?'),
    const QuestionsAnswers(
        answers: true, questions: 'Woody is the name of the toy in Toy Story?'),
    const QuestionsAnswers(
        answers: false, questions: 'you can\'t get ice from frozen water?'),
    const QuestionsAnswers(
        answers: true, questions: 'We go to the Zoo to see a lot of animals?'),
    const QuestionsAnswers(
        answers: false,
        questions: 'The color of the stars on the American flag are purple?'),
    const QuestionsAnswers(
        answers: true,
        questions: 'Snow White was the youngest Disney Princess?'),
    const QuestionsAnswers(
        answers: false, questions: 'We have just sixteen solar planets?'),
    const QuestionsAnswers(
        answers: false,
        questions: 'the Atlantic ocean is off the California coast?'),
    const QuestionsAnswers(
        answers: true, questions: 'Santa Claus lives in the North Pole?'),
    const QuestionsAnswers(
        answers: true, questions: 'California is more famous for Hollywood?'),
    const QuestionsAnswers(
        answers: true, questions: 'A Caterpillar can turn into a Butterfly?'),
    const QuestionsAnswers(
        answers: true, questions: 'Yellow is the color of a school bus?'),
    const QuestionsAnswers(
        answers: false,
        questions: 'We use our pencils to write on a blackboard?'),
    const QuestionsAnswers(
        answers: true,
        questions: 'The Great Pyramid of Giza is located at Egypt?'),
    const QuestionsAnswers(
        answers: false, questions: 'Bees have five pairs of wings?'),
    const QuestionsAnswers(
        answers: false, questions: 'Bees can\'t make honey?'),
    const QuestionsAnswers(
        answers: true, questions: 'We have 365 days in a year?'),
    const QuestionsAnswers(
        answers: false, questions: 'A group of lions is called a school?'),
    const QuestionsAnswers(
        answers: true, questions: 'Abu in Aladdin was a monkey?'),
  ];

  bool? correctAnswer() {
    return questionContainer[questionNumber - 1].answers;
  }
}
