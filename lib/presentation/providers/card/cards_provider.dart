import 'package:bykefastgo/domain/repositories/card_repository.dart';
import 'package:bykefastgo/presentation/providers/card/cards_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/card.dart';
import '../../../infrastructure/errors/auth_errors.dart';
import '../../../shared/services/key_value_storage_service.dart';
import '../../../shared/services/key_value_storage_service_impl.dart';

final cardsProvider = StateNotifierProvider<CardsNotifier,CardState>((ref) {

  final keyValueStorageService = KeyValueStorageImpl();

  return CardsNotifier(
      keyValueStorageService: keyValueStorageService,
      cardRepository: ref.watch(cardsRepositoryProvider));
});


class CardsNotifier extends StateNotifier<CardState>{

  final CardRepository cardRepository;
  final KeyValueStorage keyValueStorageService;

  CardsNotifier({required this.keyValueStorageService,
    required this.cardRepository}) : super(CardState.initial()){
    getCardsByUserId();
  }

  Future<void>getCardsByUserId()async{
    final userId = await keyValueStorageService.getValue<int>('userId');
    final cards = await cardRepository.getCardByUserId(userId!);

    state = state.copyWith(cards: cards);
  }

  Future<CardPayment>getCardsById(int cardId) async{
    return await cardRepository.getCardById(cardId);
  }


  Future<void> createCard(String cardType,String cardNumber,String cardHolder,
      String cardExpirationDate,String cardCvv) async{
    await Future.delayed(const Duration(milliseconds: 500));
    try{
      final userId = await keyValueStorageService.getValue<int>('userId');
      final cardPayment = CardPayment(
        id: 0,
        cardNumber: cardNumber,// Puedes asignar un valor temporal o manejar esto en el servidor
        cardType: cardType,
        cardCvv: cardCvv,
        cardExpirationDate: cardExpirationDate,
        cardAmount: 3000.00,
        cardHolder: cardHolder,
        cardMain: false, // Puedes asignar un valor temporal o manejar esto en el servidor
      );


      cardRepository.createCard(userId!, cardPayment);

    } catch(e){
      throw e;
    }
  }


}


class CardState{
  final List<CardPayment> cards;
  final String errorMessage;

  CardState({
    this.cards = const[],
    this.errorMessage = ''
  });

  factory CardState.initial(){
    return CardState(cards:[]);
  }

  CardState copyWith({
    List<CardPayment>? cards,
    String? errorMessage,
  }){
    return CardState(
      cards : cards ?? this.cards,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}