import 'package:bykefastgo/presentation/providers/card/cards_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:bykefastgo/shared/shared.dart';

import '../../providers/card/addcards_form_provider.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: _AddCardScreenState());
  }
}

class _AddCardScreenState extends ConsumerWidget {
  const _AddCardScreenState();

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCardForm = ref.watch(addCardFormProvider);
    ref.listen(cardsProvider, (previous, next) {
      if (next.errorMessage.isNotEmpty) {
        showSnackBar(context, next.errorMessage);
      }
    });

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go('/payment-details');
              },
              icon: const Icon(LineAwesomeIcons.angle_left_solid)),
          title: const Text('Añadir medio de pago'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              _cardTypeField(ref: ref),
              divider(),
              _cardNumberInputField(ref: ref),
              divider(),
              _cardNameField(ref: ref),
              divider(),
              Row(
                children: [
                  Expanded(child: _cardExpiryDateField(ref: ref)),
                  const SizedBox(
                      width: 10), // Espaciador opcional entre los campos
                  Expanded(
                    child: _cardCVVField(ref: ref),
                  )
                ],
              ),
              divider(),
              _addCardButton(
                  onClick: () {},
                  ref: ref,
                  addCardForm: addCardForm,
                  context: context),
            ],
          ),
        ));
  }

  Widget _addCardButton({
    required VoidCallback onClick,
    required WidgetRef ref,
    required AddCardFormState addCardForm,
    required BuildContext context,
  }) {
    return SizedBox(
        width: double.infinity,
        child: CustomFilledButton(
          text: 'Añadir tarjeta',
          buttonColor: const Color.fromARGB(255, 97, 189, 215),
          onPressed: addCardForm.isPosting
              ? null
              : ref.read(addCardFormProvider.notifier).onSubmit,
          isPosting: addCardForm.isPosting,
        ));
  }

  Widget _cardTypeField({
    required WidgetRef ref,
  }) {
    return TextFormField(
      decoration: const InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.credit_score,
              color: Colors.black,
            ),
          ),
          labelText: 'Card type',
          hintText: 'Visa / Mastercard',
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          ))),
      onChanged: ref.read(addCardFormProvider.notifier).onCardTypeChange,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
    );
  }

  Widget _cardNameField({
    required WidgetRef ref,
  }) {
    return TextFormField(
      decoration: const InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          labelText: 'Card Holder Name',
          hintText: 'Leonel Messi',
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          ))),
      onChanged: ref.read(addCardFormProvider.notifier).onCardHolderChange,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
    );
  }

  Widget _cardCVVField({
    required WidgetRef ref,
  }) {
    return TextFormField(
      decoration: const InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.credit_card_off,
            color: Colors.black,
          ),
        ),
        labelText: 'CVV',
        hintText: '***',
        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onChanged: ref.read(addCardFormProvider.notifier).onCardCvvChange,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      textInputAction: TextInputAction.done,
    );
  }

  Widget _cardExpiryDateField({
    required WidgetRef ref,
  }) {
    return TextFormField(
      decoration: const InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.calendar_month,
            color: Colors.black,
          ),
        ),
        labelText: 'Year/Month',
        hintText: 'YY/MM',
        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onChanged:
          ref.read(addCardFormProvider.notifier).onCardExpirationDateChange,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        CardDateFormatter()
      ],
      textInputAction: TextInputAction.done,
    );
  }

  Widget _cardNumberInputField({
    required WidgetRef ref,
  }) {
    return TextFormField(
      decoration: const InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.credit_card,
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: 'XXXX-XXXX-XXXX-XXXX',
        labelText: 'Card Number',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        counterText: '',
        isDense: true,
      ),
      textAlignVertical: TextAlignVertical.bottom,
      maxLength: 19,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      onChanged: ref.read(addCardFormProvider.notifier).onCardNumberChange,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(19),
        CardNumberFormatter(),
      ],
    );
  }

  SizedBox divider() => const SizedBox(height: 18);
}

class CardDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String newText = newValue.text;
    final String newTextFiltered = newText.replaceAll(
      RegExp(r'[^\d]'),
      '',
    );

    final int selectionIndexFromRight = newText.length - newValue.selection.end;
    int offset = 0;

    final StringBuffer newTextBuffer = StringBuffer();
    for (int i = 0; i < newTextFiltered.length; i++) {
      if (i > 0 && i % 2 == 0) {
        newTextBuffer.write('-');
        if (newValue.selection.end >= i + offset) {
          offset++;
        }
      }
      newTextBuffer.write(newTextFiltered[i]);
    }

    return TextEditingValue(
      text: newTextBuffer.toString(),
      selection: TextSelection.collapsed(
          offset: newTextBuffer.length - selectionIndexFromRight),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;
    final String newTextFiltered = newText.replaceAll(RegExp(r'[^\d]'), '');

    final int selectionIndexFromRight = newText.length - newValue.selection.end;
    int offset = 0;

    final StringBuffer newTextBuffer = StringBuffer();
    for (int i = 0; i < newTextFiltered.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newTextBuffer.write('-');
        if (newValue.selection.end >= i + offset) {
          offset++;
        }
      }

      newTextBuffer.write(newTextFiltered[i]);
    }

    return TextEditingValue(
        text: newTextBuffer.toString(),
        selection: TextSelection.collapsed(
          offset: newTextBuffer.length - selectionIndexFromRight,
        ));
  }
}
