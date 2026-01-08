import Foundation

enum AddPaymentError: String, LocalizedError {

	case dataNil,
		 encryptedPassData,
		 ephemeralPublicKey,
		 activationData,
		 fromIDIResponse


	var errorDescription: String? {
		switch self {
		case .dataNil: return "PARAMETERS IS REQUIRED !"
		default: return "\(self.rawValue) PARAMETER IS REQUIRED !"
		}
	}
}
