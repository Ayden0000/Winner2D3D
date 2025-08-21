List<String> getAllPermutations(String input) {
  List<String> results = [];

  void generateRecursive(
    String currentPermutation,
    String remainingChars,
  ) {
    if (remainingChars.isEmpty) {
      results.add(currentPermutation);
      return;
    }

    for (int i = 0; i < remainingChars.length; i++) {
      String charToAppend = remainingChars[i];
      String nextPermutation = currentPermutation + charToAppend;
      String nextRemainingChars =
          remainingChars.substring(0, i) +
          remainingChars.substring(i + 1);
      generateRecursive(nextPermutation, nextRemainingChars);
    }
  }

  generateRecursive("", input);
  return results;
}

Set<int> selectEvenAndOddIndices(List<int> list, int startIndex) {
  Set<int> selectedIndices = {};
  for (int i = startIndex; i < list.length; i += 2) {
    selectedIndices.add(list[i]);
  }
  return selectedIndices;
}

Set<int> selectSpecificIndices(
  List<int> list,
  List<int> indicesToSelect,
) {
  Set<int> selectedIndices = {};
  for (int i in indicesToSelect) {
    selectedIndices.add(list[i]);
  }
  print("Selected Indices: $selectedIndices");
  return selectedIndices;
}
