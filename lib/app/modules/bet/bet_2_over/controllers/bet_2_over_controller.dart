import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:winner_v3_5/app/data/consts/permutations.dart';
import 'package:winner_v3_5/app/modules/bet/bet_2_d/controllers/bet_service.dart';

class Bet2OverController extends GetxController {
  //controllers
  final TextEditingController amountController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  late PageController pageController = PageController();

  //reactive variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final RxList<Map<String, dynamic>> addedBets = <Map<String, dynamic>>[].obs;
  var isOpen = false.obs;
  var isListPage = false.obs;
  Set<int> selectedIndices = <int>{}.obs;
  var pattern = 'None'.obs;
  late String time;

  //services
  final BetService twoDBetService = BetService();

  //number list
  final List<int> indices = List.generate(100, (i) => i);
  RxList<String> numbers = <String>[].obs;

  @override
  void onClose() {
    amountController.dispose();
    numberController.dispose();
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    time = Get.arguments['time'];

    pageController.addListener(() {
      if (pageController.page!.round() == 0) {
        isListPage.value = false;
      } else {
        isListPage.value = true;
      }
    });
    numbers.value = List.generate(100, (i) => i.toString().padLeft(2, '0'));
  }

  //+ and - amount
  void increaseAmount(TextEditingController controller) {
    if (controller.text.isEmpty) {
      controller.text = '0';
    }
    final currentAmount = int.tryParse(controller.text) ?? 0;
    final newAmount = currentAmount + 100;
    controller.text = newAmount.toString();
  }

  void decreaseAmount(TextEditingController controller) {
    if (controller.text.isEmpty || controller.text == '0') {
      return;
    }
    final currentAmount = int.tryParse(controller.text) ?? 0;
    final newAmount = currentAmount - 100;
    if (newAmount < 0) {
      controller.text = '0';
    } else {
      controller.text = newAmount.toString();
    }
  }

  //list functions
  void addToList() async {
    if (selectedIndices.isEmpty ||
        amountController.text.isEmpty ||
        amountController.text == '0') {
      await QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Invalid Amount',
        confirmBtnText: 'OK',
        confirmBtnColor: Colors.red,
        text: 'Please select numbers and enter amount.',
      );
      return;
    }
    List<String> _selectedNumbers = [];

    for (var i in selectedIndices) {
      _selectedNumbers.add(i.toString().padLeft(2, '0'));
    }
    await QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.confirm,
      text:
          'Do you set limit betting amount for ${_selectedNumbers.join(', ')} to ${amountController.text}?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () {
        for (String numberStr in _selectedNumbers) {
          addedBets.add({
            'id': '${DateTime.now().millisecondsSinceEpoch}_$numberStr',
            'number': numberStr,
            'amount': int.parse(amountController.text),
          });
        }
        FocusScope.of(Get.context!).unfocus();
        Navigator.pop(Get.context!);
        pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        selectedIndices.clear();
        numberController.clear();
        amountController.clear();
      },
      onCancelBtnTap: () {
        Navigator.pop(Get.context!);
      },
    );
  }

  void updateBetAmount(Map<String, dynamic> betEntry, int newAmount) {
    final index = addedBets.indexOf(betEntry);
    if (index != -1) {
      addedBets[index]['amount'] = newAmount;
      addedBets.refresh(); // Notify listeners
    }
  }

  void removeBet(betEntry) {
    addedBets.removeWhere((b) => b['id'] == betEntry['id']);
  }

  void clearBets() {
    addedBets.clear();
  }

  void toggleOpen() {
    isOpen.value = !isOpen.value;
  }

  void clearSelectedIndices() {
    selectedIndices.clear();
    pattern.value = 'None';
  }

  //select functions
  void selectOddAndEvenIndices(index) {
    int _startIndex = index;
    selectedIndices
      ..clear()
      ..addAll(selectEvenAndOddIndices(indices, _startIndex));
    if (index == 0) {
      pattern.value = 'None';
    }
    if (index == 1) {
      pattern.value = 'None';
    }
  }

  void selectSpecificIndices(List<int> indicesToSelect) {
    selectedIndices
      ..clear()
      ..addAll(indices.where((i) => indicesToSelect.contains(i)));
  }

  void onPressedR() {
    if (selectedIndices.isEmpty) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Invalid Number',
        confirmBtnText: 'OK',
        confirmBtnColor: Colors.red,
        text: 'Please select a number first.',
      );
      return;
    }
    final _rIndices = selectedIndices.map((i) => i.toString()).toList();

    for (var i in _rIndices) {
      if (i.length == 1) {
        i = '0$i';
      }
      final rNumber = i[1] + i[0];
      final rIndex = int.parse(rNumber);
      selectedIndices.add(rIndex);
    }
  }

  void onPressCheck() {
    if (numberController.text.isNotEmpty || numberController.text.length == 2) {
      final number = int.parse(numberController.text);
      selectedIndices.add(number);
    }
  }

  void getR(index) {
    selectedIndices.add(index);

    var rNumber = selectedIndices.last.toString();
    if (rNumber.length == 1) {
      rNumber = '0$rNumber';
    }

    final r = rNumber[1] + rNumber[0];
    final rIndex = int.parse(r);
    selectedIndices.add(rIndex);
  }

  void onTapNumber(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
  }

  bool isSelected(int index) {
    return selectedIndices.contains(index);
  }

  //limit
  Future<void> bet2d() async {
    isLoading.value = true;
    errorMessage.value = '';
    if (addedBets.isEmpty) {
      isLoading.value = false;
      return;
    }
    try {
      final res = await twoDBetService.setBet(
        addedBets,
        time,
        pattern.value,
        'TWO_O',
      );
      if (res['success']) {
        Get.snackbar(
          'Success',
          'Bet successfully placed.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearBets();
        FocusScope.of(Get.context!).unfocus();
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        return;
      } else {
        Get.snackbar(
          'Error',
          res['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
        return;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
