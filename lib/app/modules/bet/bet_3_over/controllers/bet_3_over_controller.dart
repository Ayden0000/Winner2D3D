import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:winner_v3_5/app/data/consts/permutations.dart';
import 'package:winner_v3_5/app/modules/bet/bet_2_d/controllers/bet_service.dart';

class Bet3OverController extends GetxController {
  //controllers
  final TextEditingController amountController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  late PageController pageController = PageController();

  //services
  final BetService threeDBetService = BetService();

  //reactive variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final RxList<Map<String, dynamic>> addedBets = <Map<String, dynamic>>[].obs;
  var isOpen = false.obs;
  var isListPage = false.obs;
  Set<int> selectedIndices = <int>{}.obs;
  var pattern = 'None'.obs;

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
    pageController.addListener(() {
      if (pageController.page!.round() == 0) {
        isListPage.value = false;
      } else {
        isListPage.value = true;
      }
    });
    numbers.value = List.generate(1000, (i) => i.toString().padLeft(3, '0'));
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
    if (controller.text.isEmpty) {
      controller.text = '0';
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
        int.parse(amountController.text) <= 0) {
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
    List<String> selectedNumbers = [];

    for (var i in selectedIndices) {
      selectedNumbers.add(i.toString().padLeft(3, '0'));
    }
    await QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.confirm,
      text:
          'Do you set limit betting amount for ${selectedNumbers.join(', ')} to ${amountController.text}?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () {
        for (String numberStr in selectedNumbers) {
          addedBets.add({
            'id': DateTime.now().millisecondsSinceEpoch.toString() + numberStr,
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

  void removeBet(betEntry) {
    addedBets.removeWhere((b) => b['id'] == betEntry['id']);
  }

  void clearBets() {
    addedBets.clear();
  }

  void updateBetAmount(Map<String, dynamic> betEntry, int newAmount) {
    final index = addedBets.indexOf(betEntry);
    if (index != -1) {
      addedBets[index]['amount'] = newAmount;
      addedBets.refresh(); // Notify listeners
    }
  }

  //select functions

  void onPressCheck() {
    if (numberController.text.isEmpty || numberController.text.length != 3) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Invalid Number',
        confirmBtnText: 'OK',
        confirmBtnColor: Colors.red,
        text: 'Please enter a valid 3-digit number.',
      );
      return;
    }
    final number = int.parse(numberController.text);
    selectedIndices.add(number);
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
    final rIndices = selectedIndices.map((i) => i.toString()).toList();
    for (var i in rIndices) {
      if (i.length == 1) {
        i = '00$i';
        final rNumber = getAllPermutations(i);
        for (var r in rNumber) {
          selectedIndices.add(int.parse(r));
        }
      }
      if (i.length == 2) {
        i = '0$i';
        final rNumber = getAllPermutations(i);
        for (var r in rNumber) {
          selectedIndices.add(int.parse(r));
        }
      }
      final rNumber = getAllPermutations(i);
      for (var r in rNumber) {
        selectedIndices.add(int.parse(r));
      }
    }
    pattern.value = 'R';
  }

  void getR(index) {
    selectedIndices.add(index);

    var rNumber = selectedIndices.last.toString();
    if (rNumber.length == 1) {
      rNumber = '00$rNumber';
    }
    if (rNumber.length == 2) {
      rNumber = '0$rNumber';
    }

    final rIndices = getAllPermutations(rNumber);
    for (var r in rIndices) {
      final rIndex = int.parse(r);
      selectedIndices.add(rIndex);
    }
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
  Future<void> bet3D() async {
    isLoading.value = true;
    errorMessage.value = '';
    if (addedBets.isEmpty) {
      isLoading.value = false;
      return;
    }
    try {
      final res = await threeDBetService.setBet(
        addedBets,
        'NONE',
        pattern.value,
        'THREE_O',
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

  void clearSelectedIndices() {
    selectedIndices.clear();
    pattern.value = 'None';
  }
}
