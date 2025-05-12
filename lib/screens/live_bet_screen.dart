import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winner_2d/models/api_response.dart';
import 'package:winner_2d/models/result_data.dart';
import 'package:winner_2d/screens/three_d_screen.dart';
import 'package:winner_2d/screens/two_d_screen.dart';
import 'package:winner_2d/services/stock_service.dart';
import 'package:winner_2d/services/utils.dart';
import 'package:winner_2d/widgets/big_button.dart';
import 'package:winner_2d/widgets/dark_mode_icon.dart';

class LiveBetScreen extends StatefulWidget {
  const LiveBetScreen({super.key});

  @override
  State<LiveBetScreen> createState() => _LiveBetScreenState();
}

class _LiveBetScreenState extends State<LiveBetScreen> {
  final StockService _stockService = StockService();
  ApiResponse? _apiResponse;
  Timer? _timer;
  String? _error;
  bool _isLoading = true;

  final List<String> _displayTimes = ["12:01 PM", "04:30 PM"];

  // API open_time values that correspond to _displayTimes
  final List<String> _apiOpenTimes = ["12:01:00", "16:30:00"];
  void _setScreen(Widget screen) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => screen));
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => _fetchData(),
    );
  }

  Future<void> _fetchData() async {
    try {
      final data = await _stockService.fetchStockData();
      if (mounted) {
        setState(() {
          _apiResponse = data;
          _isLoading = false;
          _error = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false; // Stop loading on error
        });
        print("Error in _fetchData: $e");
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ignore: unused_element
  String _formatApiTime(String timeString) {
    try {
      final DateFormat apiFormat = DateFormat("HH:mm:ss");
      final DateTime dateTime = apiFormat.parse(timeString);
      final DateFormat displayFormat = DateFormat("hh:mm a");
      return displayFormat.format(dateTime);
    } catch (e) {
      return timeString;
    }
  }

  ResultData? _getResultForDisplayTime(String apiOpenTime) {
    if (_apiResponse == null || _apiResponse!.result.isEmpty) {
      return null;
    }
    try {
      return _apiResponse!.result.firstWhere(
        (r) => r.openTime == apiOpenTime,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/logo.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Winner 2D3D',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        actions: [DarkModeIcon()],
      ),
      body:
          _isLoading && _apiResponse == null
              ? const Center(child: CircularProgressIndicator())
              : _error != null && _apiResponse == null
              ? Center(
                child: Text(
                  'Error: $_error\n\nPull down to refresh.',
                  textAlign: TextAlign.center,
                ),
              )
              : RefreshIndicator(
                onRefresh: _fetchData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        _apiResponse?.live.twod ?? '--',
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: color,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black26,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Updated: ${_apiResponse?.live.time ?? 'N/A'}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      if (_apiResponse != null)
                        ListView.builder(
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(),
                          itemCount: _displayTimes.length,
                          itemBuilder: (context, index) {
                            final displayTime = _displayTimes[index];
                            final apiTime = _apiOpenTimes[index];
                            final resultData =
                                _getResultForDisplayTime(apiTime);

                            Color cardColor =
                                Theme.of(
                                  context,
                                ).colorScheme.secondary;
                            String set = resultData?.set ?? '--';
                            String value = resultData?.value ?? '--';
                            String twod = resultData?.twod ?? '--';

                            return _buildResultCard(
                              time: displayTime,
                              set:
                                  (set == '--')
                                      ? _apiResponse!.live.set
                                      : set,
                              value:
                                  (value == '--')
                                      ? _apiResponse!.live.value
                                      : value,
                              twod: twod,
                              cardColor: cardColor,
                            );
                          },
                        )
                      else if (_error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Could not load results. Please check your connection and pull down to refresh.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 16,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1,
                              ),
                          children: [
                            BigButton(
                              title:
                                  '2D Betting\n(Close Time)\n11:55 AM\n3:50 PM',
                              onPressButton: () {
                                _setScreen(TwoDScreen());
                              },
                            ),
                            BigButton(
                              title:
                                  '3D Betting\n(Close Time)\n3:00 PM',
                              onPressButton: () {
                                _setScreen(ThreeDScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildResultCard({
    required String time,
    required String set,
    required String value,
    required String twod,
    required Color cardColor,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [cardColor.withOpacity(0.9), cardColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: Colors.white24, height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDataColumn("Set", set),
                  _buildDataColumn("Value", value),
                  _build2dColumn("2D", twod),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataColumn(String label, String data) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _build2dColumn(String label, String data) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              data,
              style: const TextStyle(
                color:
                    Colors.yellowAccent, // Yellow like in the image
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Colors.white70),
          ],
        ),
      ],
    );
  }
}
