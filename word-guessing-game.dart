import 'dart:html';

void main() {
  final ButtonElement btn = querySelector('button');
  final InputElement inp = querySelector('input');

  btn.onClick.take(4).where((event) => inp.value == "banana").listen(
      (event) {
        print("You won!");
      },
      onError: (err) => print(err),
      onDone: () {
        print("Bad Guessses");
      });
}
