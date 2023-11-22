import 'package:ecoanexusdemo/models/customer_model.dart';
import 'package:ecoanexusdemo/utils/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideAndFadeController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _slideAndFadeController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..forward();

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _slideAndFadeController, curve: Curves.easeIn));

    _fadeAnimation =
        CurvedAnimation(parent: _slideAndFadeController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _slideAndFadeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SlideTransition(
            position: _offsetAnimation,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.lightPurpleColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: size.height * 0.17,
                        width: size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Customers',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: size.height * 0.007,
                            ),
                            Text(
                              '378',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 19),
                            ),
                            SizedBox(
                              height: size.height * 0.007,
                            ),
                            Icon(Icons.trending_up)
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.lightPurpleColor),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * 0.17,
                        width: size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sales',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: size.height * 0.007,
                            ),
                            Text(
                              'Kshs 567,450.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            SizedBox(
                              height: size.height * 0.007,
                            ),
                            Icon(Icons.trending_up)
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.lightPurpleColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Customers by month',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.lightPurpleColor.withOpacity(0.1),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: BarChart(
                                    mainBarData(),
                                    swapAnimationDuration: animDuration,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'This month\'s customers',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    children: List.generate(
                        customerList.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(seconds: 1),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: Card(
                                    elevation: 12,
                                    color: AppColor.lightPurpleColor
                                        .withOpacity(0.1),
                                    child: ListTile(
                                      leading: Container(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          FontAwesomeIcons.solidUser,
                                          color: Color(0xFF090017),
                                          size: 18,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.lightPurpleColor),
                                      ),
                                      title: Text(
                                        customerList[index].name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: customerList[index].status ==
                                                    'Paid'
                                                ? Color(0xFF32EB39)
                                                : Colors.red),
                                        child: Text(
                                          customerList[index].status,
                                          style: TextStyle(
                                              color:
                                                  customerList[index].status ==
                                                          'Paid'
                                                      ? Colors.black
                                                      : Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Color(0xFF110F0F) : AppColor.lightPurpleColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Color.fromARGB(255, 221, 203, 40), width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white54,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 11.5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 7.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5.5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.3, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 4.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String month;
              String amount;

              switch (group.x.toInt()) {
                case 0:
                  month = 'May';
                  amount = '56';
                  break;
                case 1:
                  month = 'June';
                  amount = '34';
                  break;
                case 2:
                  month = 'July';
                  amount = '29';
                  break;
                case 3:
                  month = 'August';
                  amount = '32';
                  break;
                case 4:
                  month = 'September';
                  amount = '45';
                  break;
                case 5:
                  month = 'October';
                  amount = '24';
                  break;
                case 6:
                  month = 'November';
                  amount = '15';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                month + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: amount,
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('May', style: style);
        break;
      case 1:
        text = Text('Jun', style: style);
        break;
      case 2:
        text = Text('Jul', style: style);
        break;
      case 3:
        text = Text('Aug', style: style);
        break;
      case 4:
        text = Text('Sep', style: style);
        break;
      case 5:
        text = Text('Oct', style: style);
        break;
      case 6:
        text = Text('Nov', style: style);
        break;
      default:
        text = Text('Oct', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
