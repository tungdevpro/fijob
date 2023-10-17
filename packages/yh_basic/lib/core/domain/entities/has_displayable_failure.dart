class DisplayableFailure {
  String? title;
  String? message;

  DisplayableFailure({this.title, this.message});

  DisplayableFailure.commentError([String? msg]) : message = msg ?? '';
}

abstract class HasDisplayableFailure {
  DisplayableFailure displayableFailure();
}

