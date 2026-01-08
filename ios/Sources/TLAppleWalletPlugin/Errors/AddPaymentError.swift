import Foundation

enum AddPaymentError: String, LocalizedError {

	case dataNil,
		 encryptedPassData,
		 ephemeralPublicKey,
		 activationData,
		 fromIDIResponse,
		 requestNotSuccess


	var errorDescription: String? {
		switch self {
		case .dataNil: return "PARAMETERS IS REQUIRED !"
		case .requestNotSuccess: return "REQUEST NOT SUCCESSFUL"
		default: return "\(self.rawValue) PARAMETER IS REQUIRED !"
		}
	}
}
