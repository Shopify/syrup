// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	enum TaxExemption: String, Codable {
		/// This customer is exempt from specific taxes for holding a valid STATUS_CARD_EXEMPTION in Canada.
			case caStatusCardExemption = "CA_STATUS_CARD_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid RESELLER_EXEMPTION in British Columbia.
			case caBcResellerExemption = "CA_BC_RESELLER_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid RESELLER_EXEMPTION in Manitoba.
			case caMbResellerExemption = "CA_MB_RESELLER_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid RESELLER_EXEMPTION in Saskatchewan.
			case caSkResellerExemption = "CA_SK_RESELLER_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid DIPLOMAT_EXEMPTION in Canada.
			case caDiplomatExemption = "CA_DIPLOMAT_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in British Columbia.
			case caBcCommercialFisheryExemption = "CA_BC_COMMERCIAL_FISHERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Manitoba.
			case caMbCommercialFisheryExemption = "CA_MB_COMMERCIAL_FISHERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Nova Scotia.
			case caNsCommercialFisheryExemption = "CA_NS_COMMERCIAL_FISHERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Prince Edward Island.
			case caPeCommercialFisheryExemption = "CA_PE_COMMERCIAL_FISHERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid COMMERCIAL_FISHERY_EXEMPTION in Saskatchewan.
			case caSkCommercialFisheryExemption = "CA_SK_COMMERCIAL_FISHERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid PRODUCTION_AND_MACHINERY_EXEMPTION in British Columbia.
			case caBcProductionAndMachineryExemption = "CA_BC_PRODUCTION_AND_MACHINERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid PRODUCTION_AND_MACHINERY_EXEMPTION in Saskatchewan.
			case caSkProductionAndMachineryExemption = "CA_SK_PRODUCTION_AND_MACHINERY_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid SUB_CONTRACTOR_EXEMPTION in British Columbia.
			case caBcSubContractorExemption = "CA_BC_SUB_CONTRACTOR_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid SUB_CONTRACTOR_EXEMPTION in Saskatchewan.
			case caSkSubContractorExemption = "CA_SK_SUB_CONTRACTOR_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid CONTRACTOR_EXEMPTION in British Columbia.
			case caBcContractorExemption = "CA_BC_CONTRACTOR_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid CONTRACTOR_EXEMPTION in Saskatchewan.
			case caSkContractorExemption = "CA_SK_CONTRACTOR_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid PURCHASE_EXEMPTION in Ontario.
			case caOnPurchaseExemption = "CA_ON_PURCHASE_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid FARMER_EXEMPTION in Manitoba.
			case caMbFarmerExemption = "CA_MB_FARMER_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid FARMER_EXEMPTION in Nova Scotia.
			case caNsFarmerExemption = "CA_NS_FARMER_EXEMPTION"
		/// This customer is exempt from specific taxes for holding a valid FARMER_EXEMPTION in Saskatchewan.
			case caSkFarmerExemption = "CA_SK_FARMER_EXEMPTION"
		case unknownValue = ""

		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let stringValue = try container.decode(String.self)
			if let value = TaxExemption(rawValue: stringValue) {
				self = value
			} else {
				self = .unknownValue
			}
		}
	}
}
