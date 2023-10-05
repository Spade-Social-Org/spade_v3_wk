extension Date on Duration {
  int inWeeks() {
    return inDays ~/ 7;
  }

  int inMonths() {
    return inWeeks() ~/ 4;
  }

  int inYear() {
    return inMonths() ~/ 12;
  }
}
