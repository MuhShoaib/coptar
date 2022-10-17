import 'package:copter/view/company/subscriptions/payment.dart';
import 'package:copter/view/constant/colors.dart';
import 'package:copter/view/constant/images.dart';
import 'package:copter/view/constant/other.dart';
import 'package:copter/view/widget/custom_app_bar.dart';
import 'package:copter/view/widget/my_button.dart';
import 'package:copter/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  var currentPlan = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Subscription',
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          MyText(
            align: TextAlign.center,
            text: 'Get subscription',
            size: 18,
            weight: FontWeight.w500,
          ),
          MyText(
            paddingTop: 10,
            align: TextAlign.center,
            text:
                'Lorem Ipsum is simply dummy text of the printing industry\'s standard dummy text',
            size: 12,
            paddingBottom: 50,
          ),
          plans(
            'Basic',
            '99',
            '/month',
            [
              'Get 10 employee account',
              'Get 54 task',
              '24/7 support',
            ],
            0,
          ),
          plans(
            'Premium',
            '129',
            '/month',
            [
              'Get unlimited employee',
              'Get unlimited task',
              '24/7 support',
            ],
            1,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 70,
          child: Center(
            child: SizedBox(
              width: Get.width * 0.8,
              child: MyButton(
                haveRoundedEdges: true,
                haveCustomElevation: true,
                onPressed: () => Get.to(() => const Payment()),
                text: 'Proceed to payment',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget plans(String? type, price, duration, List features, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentPlan = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: RadiusHandler.radius10,
          border: Border.all(
            width: 2.0,
            color: currentPlan == index ? kBorderColor : kPrimaryColor,
          ),
          boxShadow: [
            currentPlan == index
                ? const BoxShadow()
                : BoxShadow(
                    color: kBlackColor.withOpacity(0.04),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              align: TextAlign.center,
              text: type,
              weight: FontWeight.w500,
              color: kSecondaryColor,
              paddingBottom: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: '\$$price',
                  size: 18,
                  weight: FontWeight.w500,
                ),
                MyText(
                  text: '/$duration',
                  size: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                features.length,
                (f) => featuresTiles(features[f]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget featuresTiles(String? title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                kCheckIcon,
                height: 16,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: title,
                size: 12,
                paddingLeft: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//subscription
