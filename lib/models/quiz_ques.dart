class QuizQuestion {
  const QuizQuestion(this.ques, this.ans);
  final String ques;
  final List<String> ans;
  List<String> shuffledlist() {
    final shuffledlist = List.of(ans);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
