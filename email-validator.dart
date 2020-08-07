import 'dart:html';
import 'dart:async';

void main() {
  final ButtonElement btn = querySelector('button');
  final InputElement input = querySelector('input');
  final DivElement div = querySelector('div');

  final validator =
      new StreamTransformer.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Enter a valid email");
    }
  });

  input.onInput
      .map((dynamic event) => event.target.value)
      .transform(validator)
      .listen(
    (event) {
      div.innerHtml = "";
    },
    onError: (err) {
      div.innerHtml = err;
    },
  );
}
