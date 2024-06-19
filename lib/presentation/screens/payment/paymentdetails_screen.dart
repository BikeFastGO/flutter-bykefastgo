import 'package:bykefastgo/presentation/providers/card/cards_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../shared/util/shared_entities/cards_list.dart';

class PaymentDetailsScreen extends ConsumerStatefulWidget{
  const PaymentDetailsScreen({super.key});

  @override
  PaymentDetailsScreenState createState()=>
      PaymentDetailsScreenState();
}

class PaymentDetailsScreenState extends ConsumerState{

  @override
  void initState(){
    super.initState();
    ref.read(cardsProvider.notifier).getCardsByUserId();
  }

  @override
  Widget build(BuildContext context) {

    final cardState = ref.watch(cardsProvider);
    cardsLoaded = cardState.cards;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/profile');
            },
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: const Text('Detalles de pago'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.go('/payment-details/addCard');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        mini: true,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add_circle_outline_rounded,
          size: 30,
          color: Colors.white.withOpacity(0.8),
        )
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: cardState.cards.length,
              itemBuilder: (context,index){
                final card = cardState.cards[index];
                return Align(
                  heightFactor: 0.6,
                  alignment: Alignment.topCenter,
                  child: CreditCardWidget(
                    cardType: card.cardType,
                    cardNumber: card.cardNumber,
                    cardHolder: card.cardHolder,
                  ),
                );}
          )
        ),

      )
    );
  }
}


class CreditCardWidget extends ConsumerStatefulWidget{
  const CreditCardWidget({
    required this.cardType,
    required this.cardNumber,
    required this.cardHolder,
    super.key
  });

  final String cardType;
  final String cardNumber;
  final String cardHolder;

  @override
  ConsumerState<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends ConsumerState<CreditCardWidget>{

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Colors.accents
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 6.0,
            spreadRadius: 2.0,
          )
        ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           Text(
            widget.cardType,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Text(
              widget.cardNumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white
              ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.cardHolder,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Icon(
                Icons.credit_card,
                size:32,
                color: Colors.white,
              )
            ],
          )
        ]
      ),
    );
  }

}
