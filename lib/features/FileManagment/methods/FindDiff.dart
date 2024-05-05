String findDifference({required String shortText, required String longText}) {
  String diff = "";
  int iShort = 0;
  int iLong = 0;
  while (iShort < shortText.length && iLong < longText.length) {
    if (shortText[iShort] != longText[iLong]) {
      diff += longText[iLong];
      iShort--;
    }
    iShort++;
    iLong++;
  }
  if (diff == "") {
    while (iLong < longText.length) {
      diff += longText[iLong];
      iLong++;
    }
  }
  return diff;
}
