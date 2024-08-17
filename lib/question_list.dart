class Qs {
  String img, text;
  bool answer;
  Qs({required this.img, required this.text, required this.answer});
}

class Questionlist {
  int questionNumber = 0;
  final List<Qs> questionlist = [
    Qs(img: 'image-1.jpg', text: 'say yes', answer: true),
    Qs(img: 'image-2.jpg', text: 'say yes', answer: true),
    Qs(img: 'image-3.jpg', text: 'say no', answer: false),
    Qs(img: 'image-4.jpg', text: 'say yes', answer: true),
  ];
  String getImg() {
    return questionlist[questionNumber].img;
  }

  String getText() {
    return questionlist[questionNumber].text;
  }

  bool getAnswer() {
    return questionlist[questionNumber].answer;
  }

  void nextQuestion() {
    // if (questionNumber < questionlist.length -1) {
    //   questionNumber++;
    // }
    questionNumber = (questionNumber + 1) % 4;
  }
}
