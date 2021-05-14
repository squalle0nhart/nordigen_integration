part of 'package:nordigen_integration/nordigen_integration.dart';

/// Transaction Data Model for Nordigen.
///
/// The only mandatory value is [transactionAmount].
///
/// Refer https://nordigen.com/en/docs/account-information/output/transactions/.
/// for all the optional and conditional (nullable) values.
class TransactionData {
  const TransactionData({
    this.id,
    this.entryReference,
    this.mandateId,
    this.checkId,
    this.creditorId,
    this.bookingDate,
    this.valueDate,
    required this.transactionAmount,
    this.currencyExchange,
    this.creditorName,
    this.creditorAccount,
    this.creditorAgent,
    this.ultimateCreditor,
    this.debtorName,
    this.debtorAccount,
    this.debtorAgent,
    this.ultimateDebtor,
    this.remittanceInformationUnstructured,
    this.remittanceInformationUnstructuredArray,
    this.remittanceInformationStructured,
    this.remittanceInformationStructuredArray,
    this.additionalInformation,
    this.additionalInformationStructured,
    this.purposeCode,
    this.bankTransactionCode,
    this.proprietaryBankTransactionCode,
    this.balanceAfterTransaction,
    this.links,
  });

  /// For easy Data Model Generation from Map fetched by querying Nordigen.
  factory TransactionData.fromMap(dynamic fetchedMap) {
    // Validate data first.
    assert(fetchedMap['transactionAmount'] != null);
    assert(fetchedMap['transactionAmount']['amount'] != null);
    assert(fetchedMap['transactionAmount']['currency'] != null);
    return TransactionData(
      id: fetchedMap['transactionId'] as String?,
      entryReference: fetchedMap['entryReference'] as String?,
      mandateId: fetchedMap['mandateId'] as String?,
      checkId: fetchedMap['checkId'] as String?,
      creditorId: fetchedMap['creditorId'] as String?,
      bookingDate: fetchedMap['bookingDate'] as String?,
      valueDate: fetchedMap['valueDate'] as String?,
      transactionAmount: TransactionAmountData(
        amount: fetchedMap['transactionAmount']['amount'] as String,
        currency: fetchedMap['transactionAmount']['currency'] as String,
      ),
      currencyExchange: fetchedMap['currencyExchange'] as List<dynamic>?,
      creditorName: fetchedMap['creditorName'] as String?,
      creditorAccount: fetchedMap['creditorAccount'] as Map<String, dynamic>?,
      creditorAgent: fetchedMap['creditorAgent'] as String?,
      ultimateCreditor: fetchedMap['ultimateCreditor'] as String?,
      debtorName: fetchedMap['debtorName'] as String?,
      debtorAccount: fetchedMap['debtorAccount'] as Map<String, dynamic>,
      debtorAgent: fetchedMap['debtorAgent'] as String?,
      ultimateDebtor: fetchedMap['ultimateDebtor'] as String?,
      remittanceInformationUnstructured:
          fetchedMap['remittanceInformationUnstructured'] as String?,
      remittanceInformationUnstructuredArray:
          fetchedMap['remittanceInformationUnstructuredArray'] as List<String>?,
      remittanceInformationStructured:
          fetchedMap['remittanceInformationStructured'] as String?,
      remittanceInformationStructuredArray:
          fetchedMap['remittanceInformationStructuredArray'] as List<dynamic>?,
      additionalInformation: fetchedMap['additionalInformation'] as String?,
      additionalInformationStructured:
          fetchedMap['additionalInformationStructured'] as dynamic?,
      purposeCode: fetchedMap['purposeCode'] as String?,
      bankTransactionCode: fetchedMap['bankTransactionCode'] as String?,
      proprietaryBankTransactionCode:
          fetchedMap['proprietaryBankTransactionCode'] as String?,
      // TODO: Verify key of balanceAfterTransaction from
      // https://nordigen.com/en/docs/account-information/output/transactions/
      balanceAfterTransaction: fetchedMap['balanceAfterTransaction'] != null
          ? Balance?.fromMap(fetchedMap['balanceAfterTransaction'])
          : null,
      links: fetchedMap['bankTransactionCode'] as List<String>?,
    );
  }

  /// Forms a [Map] of [String] keys and [dynamic] values from Class Data.
  ///
  /// Map Keys: https://nordigen.com/en/docs/account-information/output/transactions/
  Map<String, dynamic> toMap() => <String, dynamic>{
        'transactionId': id,
        'entryReference': debtorName,
        'mandateId': mandateId,
        'checkId': checkId,
        'creditorId': creditorId,
        'bookingDate': bookingDate,
        'valueDate': valueDate,
        'transactionAmount': transactionAmount.toMap(),
        'currencyExchange': currencyExchange,
        'creditorName': creditorName,
        'creditorAccount': creditorAccount,
        'creditorAgent': creditorAgent,
        'ultimateCreditor': ultimateCreditor,
        'debtorName': debtorName,
        'debtorAccount': debtorAccount,
        'debtorAgent': debtorAgent,
        'ultimateDebtor': ultimateDebtor,
        'remittanceInformationUnstructured': remittanceInformationUnstructured,
        'remittanceInformationUnstructuredArray':
            remittanceInformationUnstructuredArray,
        'remittanceInformationStructured': remittanceInformationStructured,
        'remittanceInformationStructuredArray':
            remittanceInformationStructuredArray,
        'additionalInformation': additionalInformation,
        'additionalInformationStructured': additionalInformationStructured,
        'purposeCode': purposeCode,
        'bankTransactionCode': bankTransactionCode,
        'proprietaryBankTransactionCode': proprietaryBankTransactionCode,
        'balanceAfterTransaction': balanceAfterTransaction?.toMap(),
        'links': links,
      };

  /// Identifier of this particular Transaction
  final String? id;

  /// Identification of the transaction as used for reference given by ASPSP.
  final String? entryReference;

  /// Identification of Mandates, e.g. a SEPA Mandate ID
  final String? mandateId;

  /// Identification of a Cheque.
  final String? checkId;

  /// 	Identification of Creditors, e.g. a SEPA Creditor ID
  final String? creditorId;

  /// Date when an entry is posted to an account on ASPSP's books. As [String].
  final String? bookingDate;

  /// Date at which assets become available to the account owner in case of a
  /// credit. As [String].
  final String? valueDate;

  /// Transaction amount details associated with this.
  final TransactionAmountData transactionAmount;

  /// Array of Report Exchnage Rate.
  final List<dynamic>? currencyExchange;

  /// Name of the Transaction creditor if a "Debited" transaction
  final String? creditorName;

  /// Creditor Account Map (if any)
  final Map<String, dynamic>? creditorAccount;

  /// BICFI of the Transaction creditor (if any)
  final String? creditorAgent;

  /// Transaction's ultimate creditor (if any)
  final String? ultimateCreditor;

  /// Name of the debtor if a "Credited" transaction
  final String? debtorName;

  /// Debtor Account Map (if any)
  final Map<String, dynamic>? debtorAccount;

  /// BICFI of the Transaction debtor (if any)
  final String? debtorAgent;

  /// Transaction's ultimate debtor (if any)
  final String? ultimateDebtor;

  /// Unstructured Remittance information about the Transaction (if any)
  final String? remittanceInformationUnstructured;

  /// Unstructured Remittance information Array about the Transaction (if any)
  final List<String>? remittanceInformationUnstructuredArray;

  /// Structured Remittance information about the Transaction (if any)
  final String? remittanceInformationStructured;

  /// Structured Remittance information Array about the Transaction (if any)
  final List<dynamic>? remittanceInformationStructuredArray;

  /// Might be used by the ASPSP to transport additional transaction information
  final String? additionalInformation;

  /// Is used if and only if the bookingStatus entry equals "information"
  final dynamic? additionalInformationStructured;

  /// The transaction's purpose code (if any)
  final String? purposeCode;

  /// Bank transaction code as used by the ASPSP and using the
  /// sub elements of this structured code defined by ISO20022.
  final String? bankTransactionCode;

  /// Proprietary bank transaction code as used within community/within an ASPSP
  final String? proprietaryBankTransactionCode;

  ///	This is the balance after this transaction.
  /// Recommended balance type is interimBooked.
  final Balance? balanceAfterTransaction;

  /// The following links could be used here: transactionDetails for retrieving
  /// details of a transaction.
  final List<String>? links;

  /// Returns the class data converted to a map as a Serialized JSON String.
  @override
  String toString() => jsonEncode(toMap());
}

/// Holds the transaction [amount] and the [currency] type
class TransactionAmountData {
  const TransactionAmountData({required this.amount, required this.currency});

  final String currency;
  final String amount;

  /// Parses the amount value from string to a double numeric.
  double get getAmountNumber => double.parse(amount);

  /// Forms a [Map] of [String] keys and [dynamic] values from Class Data.
  ///
  /// Map Keys: "amount" and "currency".
  Map<String, dynamic> toMap() => <String, dynamic>{
        'amount': amount,
        'currency': currency,
      };

  /// Returns the class data converted to a map as a Serialized JSON String.
  @override
  String toString() => jsonEncode(toMap());
}