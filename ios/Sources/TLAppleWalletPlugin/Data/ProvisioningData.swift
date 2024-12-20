import Foundation
import PassKit

@objc
class ProvisioningData: NSObject {

	// MARK: - Variables
	let cardholderName: String
	let primaryAccountSuffix: String?
	let localizedDescription: String
	let paymentNetwork: PKPaymentNetwork
	let encryptionScheme: PKEncryptionScheme

	// MARK: - Init
	init(data: [AnyHashable : Any]?) throws {
		guard let data else { throw ProvisioningDataError.dataNil }

		guard let cardholderName = data["cardholderName"] as? String,
			  !cardholderName.isEmpty
		else { throw ProvisioningDataError.cardholderName }

		guard let localizedDescription = data["localizedDescription"] as? String,
			  !localizedDescription.isEmpty
		else { throw ProvisioningDataError.localizedDescription }

		guard let paymentNetwork = data["paymentNetwork"] as? String,
			  !paymentNetwork.isEmpty
		else { throw ProvisioningDataError.paymentNetwork }


		self.cardholderName = cardholderName
		self.primaryAccountSuffix = data["primaryAccountSuffix"] as? String
		self.localizedDescription = localizedDescription

		switch paymentNetwork {
		case "VISA": self.paymentNetwork = .visa
		case "MASTERCARD": self.paymentNetwork = .masterCard
		case "CARTES_BANCAIRES": self.paymentNetwork = .cartesBancaires
		default: throw ProvisioningDataError.invalidPaymentNetwork
		}

		switch data["encryptionScheme"] as? String {
        case "RSA_V2": self.encryptionScheme = .RSA_V2
        default: self.encryptionScheme = .ECC_V2
        }


		super.init()
	}
}
