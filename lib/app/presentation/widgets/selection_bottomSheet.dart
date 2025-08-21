import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/data/consts/patterns.dart';

const Color primaryBackgroundColor = Colors.white;
const Color primaryTextColor = Colors.black;
const Color labelTextColor = Colors.black54;
const Color accentColor = Colors.black;
final Color grabberColor = Colors.grey.shade400;
void showSelectionBottomSheet(BuildContext context, {required controller}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: primaryBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext bottomSheetContext) {
      return Wrap(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Row
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.selectSpecificIndices(all);
                          Get.back();
                        },
                        customBorder: CircleBorder(),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: accentColor, width: 1.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('Select All'),
                        ),
                      ),
                      Text(
                        'အမြန်ရွေးရန်',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: Get.back,
                        customBorder: CircleBorder(),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: accentColor, width: 1.2),
                          ),
                          child: Icon(
                            Icons.close,
                            color: accentColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                _buildSectionContentRow(bottomSheetContext, 'အကွက် -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    'ကြီး',

                    onPressed: () {
                      controller.selectSpecificIndices(aKye);
                      controller.pattern.value = 'AKye';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'ငယ်',

                    onPressed: () {
                      controller.selectSpecificIndices(aNgel);
                      controller.pattern.value = 'ANgel';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'မ',

                    onPressed: () {
                      controller.selectOddAndEvenIndices(1);
                      controller.pattern.value = 'Ma';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'စုံ',

                    onPressed: () {
                      controller.selectOddAndEvenIndices(0);
                      controller.pattern.value = 'Sone';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'ညီကို',

                    onPressed: () {
                      controller.selectSpecificIndices(nyiKo);
                      controller.pattern.value = 'NyiKo';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, '', [
                  _buildStyledButton(
                    bottomSheetContext,
                    'စုံစုံ',

                    onPressed: () {
                      controller.selectSpecificIndices(soneSone);
                      controller.pattern.value = 'SoneSone';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'စုံမ',

                    onPressed: () {
                      controller.selectSpecificIndices(soneMa);
                      controller.pattern.value = 'SoneMa';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'မစုံ',

                    onPressed: () {
                      controller.selectSpecificIndices(maSone);
                      controller.pattern.value = 'MaSone';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'မမ',

                    onPressed: () {
                      controller.selectSpecificIndices(maMa);
                      controller.pattern.value = 'MaMa';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    'အပူး',

                    onPressed: () {
                      controller.selectSpecificIndices(aPuu);
                      controller.pattern.value = 'APuu';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, '၁လုံးပါ -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '0',

                    onPressed: () {
                      controller.selectSpecificIndices(includeZero);
                      controller.pattern.value = 'IncludeZero';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '1',

                    onPressed: () {
                      controller.selectSpecificIndices(includeOne);
                      controller.pattern.value = 'IncludeOne';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '2',

                    onPressed: () {
                      controller.selectSpecificIndices(includeTwo);
                      controller.pattern.value = 'IncludeTwo';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '3',

                    onPressed: () {
                      controller.selectSpecificIndices(includeThree);
                      controller.pattern.value = 'IncludeThree';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '4',

                    onPressed: () {
                      controller.selectSpecificIndices(includeFour);
                      controller.pattern.value = 'IncludeFour';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '5',

                    onPressed: () {
                      controller.selectSpecificIndices(includeFive);
                      controller.pattern.value = 'IncludeFive';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '6',

                    onPressed: () {
                      controller.selectSpecificIndices(includeSix);
                      controller.pattern.value = 'IncludeSix';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '7',

                    onPressed: () {
                      controller.selectSpecificIndices(includeSeven);
                      controller.pattern.value = 'IncludeSeven';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '8',

                    onPressed: () {
                      controller.selectSpecificIndices(includeEight);
                      controller.pattern.value = 'IncludeEight';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '9',

                    onPressed: () {
                      controller.selectSpecificIndices(includeNine);
                      controller.pattern.value = 'IncludeNine';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'ထိပ် -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '0',

                    onPressed: () {
                      controller.selectSpecificIndices(firstZero);
                      controller.pattern.value = 'FirstZero';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '1',

                    onPressed: () {
                      controller.selectSpecificIndices(firstOne);
                      controller.pattern.value = 'FirstOne';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '2',

                    onPressed: () {
                      controller.selectSpecificIndices(firstTwo);
                      controller.pattern.value = 'FirstTwo';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '3',

                    onPressed: () {
                      controller.selectSpecificIndices(firstThree);
                      controller.pattern.value = 'FirstThree';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '4',

                    onPressed: () {
                      controller.selectSpecificIndices(firstFour);
                      controller.pattern.value = 'FirstFour';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '5',

                    onPressed: () {
                      controller.selectSpecificIndices(firstFive);
                      controller.pattern.value = 'FirstFive';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '6',

                    onPressed: () {
                      controller.selectSpecificIndices(firstSix);
                      controller.pattern.value = 'FirstSix';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '7',

                    onPressed: () {
                      controller.selectSpecificIndices(firstSeven);
                      controller.pattern.value = 'FirstSeven';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '8',

                    onPressed: () {
                      controller.selectSpecificIndices(firstEight);
                      controller.pattern.value = 'FirstEight';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '9',

                    onPressed: () {
                      controller.selectSpecificIndices(firstNine);
                      controller.pattern.value = 'FirstNine';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'နောက် -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '0',

                    onPressed: () {
                      controller.selectSpecificIndices(lastZero);
                      controller.pattern.value = 'LastZero';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '1',

                    onPressed: () {
                      controller.selectSpecificIndices(lastOne);
                      controller.pattern.value = 'LastOne';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '2',

                    onPressed: () {
                      controller.selectSpecificIndices(lastTwo);
                      controller.pattern.value = 'LastTwo';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '3',

                    onPressed: () {
                      controller.selectSpecificIndices(lastThree);
                      controller.pattern.value = 'LastThree';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '4',

                    onPressed: () {
                      controller.selectSpecificIndices(lastFour);
                      controller.pattern.value = 'LastFour';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '5',

                    onPressed: () {
                      controller.selectSpecificIndices(lastFive);
                      controller.pattern.value = 'LastFive';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '6',

                    onPressed: () {
                      controller.selectSpecificIndices(lastSix);
                      controller.pattern.value = 'LastSix';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '7',

                    onPressed: () {
                      controller.selectSpecificIndices(lastSeven);
                      controller.pattern.value = 'LastSeven';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '8',

                    onPressed: () {
                      controller.selectSpecificIndices(lastEight);
                      controller.pattern.value = 'LastEight';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '9',

                    onPressed: () {
                      controller.selectSpecificIndices(lastNine);
                      controller.pattern.value = 'LastNine';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'ဘရိတ် -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '0',

                    onPressed: () {
                      controller.selectSpecificIndices(zeroBreak);
                      controller.pattern.value = 'ZeroBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '1',

                    onPressed: () {
                      controller.selectSpecificIndices(oneBreak);
                      controller.pattern.value = 'OneBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '2',

                    onPressed: () {
                      controller.selectSpecificIndices(twoBreak);
                      controller.pattern.value = 'TwoBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '3',

                    onPressed: () {
                      controller.selectSpecificIndices(threeBreak);
                      controller.pattern.value = 'ThreeBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '4',

                    onPressed: () {
                      controller.selectSpecificIndices(fourBreak);
                      controller.pattern.value = 'FourBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '5',

                    onPressed: () {
                      controller.selectSpecificIndices(fiveBreak);
                      controller.pattern.value = 'FiveBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '6',

                    onPressed: () {
                      controller.selectSpecificIndices(sixBreak);
                      controller.pattern.value = 'SixBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '7',

                    onPressed: () {
                      controller.selectSpecificIndices(sevenBreak);
                      controller.pattern.value = 'SevenBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '8',

                    onPressed: () {
                      controller.selectSpecificIndices(eightBreak);
                      controller.pattern.value = 'EightBreak';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '9',

                    onPressed: () {
                      controller.selectSpecificIndices(nineBreak);
                      controller.pattern.value = 'NineBreak';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'နက္ခတ် -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '07, 18, 24, 35, 69',
                    isLong: true,
                    minWidth: 200,
                    onPressed: () {
                      controller.selectSpecificIndices(nhakKhak);
                      controller.pattern.value = 'NhakKhak';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'နက္ခတ်(R) -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '70, 81, 42, 53, 96',
                    isLong: true,
                    minWidth: 200,
                    onPressed: () {
                      controller.selectSpecificIndices(rNhakKhak);
                      controller.pattern.value = 'RNhakKhak';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'ပါဝါ -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '05, 16, 27, 38, 49',
                    isLong: true,
                    minWidth: 200,
                    onPressed: () {
                      controller.selectSpecificIndices(power);
                      controller.pattern.value = 'Power';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),

                _buildSectionContentRow(bottomSheetContext, 'ပါဝါ(R) -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '50, 61, 72, 83, 94',
                    isLong: true,
                    minWidth: 200,
                    onPressed: () {
                      controller.selectSpecificIndices(rPower);
                      controller.pattern.value = 'RPower';
                      Get.back();
                    },
                  ),
                ]),
                const SizedBox(height: 10),
                _buildSectionContentRow(bottomSheetContext, 'အလုံး ၂၀ -', [
                  _buildStyledButton(
                    bottomSheetContext,
                    '00-19',
                    minWidth: 50,

                    onPressed: () {
                      controller.selectSpecificIndices(groupOne);
                      controller.pattern.value = 'GroupOne';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '20-39',
                    minWidth: 50,

                    onPressed: () {
                      controller.selectSpecificIndices(groupTwo);
                      controller.pattern.value = 'GroupTwo';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '40-59',
                    minWidth: 50,

                    onPressed: () {
                      controller.selectSpecificIndices(groupThree);
                      controller.pattern.value = 'GroupThree';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '60-79',
                    minWidth: 50,

                    onPressed: () {
                      controller.selectSpecificIndices(groupFour);
                      controller.pattern.value = 'GroupFour';
                      Get.back();
                    },
                  ),
                  _buildStyledButton(
                    bottomSheetContext,
                    '80-99',
                    minWidth: 50,

                    onPressed: () {
                      controller.selectSpecificIndices(groupFive);
                      controller.pattern.value = 'GroupFive';
                      Get.back();
                    },
                  ),
                ]),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildStyledButton(
  BuildContext context,
  String text, {
  VoidCallback? onPressed,
  double? minWidth,
  bool isLong = false,
  double fontSize = 14,
}) {
  return Container(
    margin: EdgeInsets.zero,
    child: OutlinedButton(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(minWidth ?? (isLong ? 90 : 0), 30),
        padding: EdgeInsets.symmetric(horizontal: isLong ? 5 : 8, vertical: 8),
        side: BorderSide(color: accentColor, width: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        backgroundColor: Colors.transparent,
        foregroundColor: accentColor,
      ).copyWith(
        textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ),
      child: Text(text),
    ),
  );
}

Widget _buildSectionContentRow(
  BuildContext context,
  String label,
  List<Widget> buttons,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 80,
        child: Text(
          label,
          style: TextStyle(color: labelTextColor, fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),

      Expanded(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.start,
          children: buttons,
        ),
      ),
    ],
  );
}
