// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	enum CurrencyCode: String, Codable, CaseIterable {
		/// United States Dollars (USD).
			case usd = "USD"
		/// Euro (EUR).
			case eur = "EUR"
		/// United Kingdom Pounds (GBP).
			case gbp = "GBP"
		/// Canadian Dollars (CAD).
			case cad = "CAD"
		/// Afghan Afghani (AFN).
			case afn = "AFN"
		/// Albanian Lek (ALL).
			case all = "ALL"
		/// Algerian Dinar (DZD).
			case dzd = "DZD"
		/// Angolan Kwanza (AOA).
			case aoa = "AOA"
		/// Argentine Pesos (ARS).
			case ars = "ARS"
		/// Armenian Dram (AMD).
			case amd = "AMD"
		/// Aruban Florin (AWG).
			case awg = "AWG"
		/// Australian Dollars (AUD).
			case aud = "AUD"
		/// Barbadian Dollar (BBD).
			case bbd = "BBD"
		/// Azerbaijani Manat (AZN).
			case azn = "AZN"
		/// Bangladesh Taka (BDT).
			case bdt = "BDT"
		/// Bahamian Dollar (BSD).
			case bsd = "BSD"
		/// Bahraini Dinar (BHD).
			case bhd = "BHD"
		/// Burundian Franc (BIF).
			case bif = "BIF"
		/// Belarusian Ruble (BYN).
			case byn = "BYN"
		/// Belarusian Ruble (BYR).
		/// - Warning:
		/// `BYR` is deprecated. Use `BYN` available from version `2019-10` onwards instead.
@available(*, deprecated, message: "")
			case byr = "BYR"
		/// Belize Dollar (BZD).
			case bzd = "BZD"
		/// Bermudian Dollar (BMD).
			case bmd = "BMD"
		/// Bhutanese Ngultrum (BTN).
			case btn = "BTN"
		/// Bosnia and Herzegovina Convertible Mark (BAM).
			case bam = "BAM"
		/// Brazilian Real (BRL).
			case brl = "BRL"
		/// Bolivian Boliviano (BOB).
			case bob = "BOB"
		/// Botswana Pula (BWP).
			case bwp = "BWP"
		/// Brunei Dollar (BND).
			case bnd = "BND"
		/// Bulgarian Lev (BGN).
			case bgn = "BGN"
		/// Burmese Kyat (MMK).
			case mmk = "MMK"
		/// Cambodian Riel.
			case khr = "KHR"
		/// Cape Verdean escudo (CVE).
			case cve = "CVE"
		/// Cayman Dollars (KYD).
			case kyd = "KYD"
		/// Central African CFA Franc (XAF).
			case xaf = "XAF"
		/// Chilean Peso (CLP).
			case clp = "CLP"
		/// Chinese Yuan Renminbi (CNY).
			case cny = "CNY"
		/// Colombian Peso (COP).
			case cop = "COP"
		/// Comorian Franc (KMF).
			case kmf = "KMF"
		/// Congolese franc (CDF).
			case cdf = "CDF"
		/// Costa Rican Colones (CRC).
			case crc = "CRC"
		/// Croatian Kuna (HRK).
			case hrk = "HRK"
		/// Czech Koruny (CZK).
			case czk = "CZK"
		/// Danish Kroner (DKK).
			case dkk = "DKK"
		/// Djiboutian Franc (DJF).
			case djf = "DJF"
		/// Dominican Peso (DOP).
			case dop = "DOP"
		/// East Caribbean Dollar (XCD).
			case xcd = "XCD"
		/// Egyptian Pound (EGP).
			case egp = "EGP"
		/// Ethiopian Birr (ETB).
			case etb = "ETB"
		/// Falkland Islands Pounds (FKP).
			case fkp = "FKP"
		/// CFP Franc (XPF).
			case xpf = "XPF"
		/// Fijian Dollars (FJD).
			case fjd = "FJD"
		/// Gibraltar Pounds (GIP).
			case gip = "GIP"
		/// Gambian Dalasi (GMD).
			case gmd = "GMD"
		/// Ghanaian Cedi (GHS).
			case ghs = "GHS"
		/// Guatemalan Quetzal (GTQ).
			case gtq = "GTQ"
		/// Guyanese Dollar (GYD).
			case gyd = "GYD"
		/// Georgian Lari (GEL).
			case gel = "GEL"
		/// Guinean Franc (GNF).
			case gnf = "GNF"
		/// Haitian Gourde (HTG).
			case htg = "HTG"
		/// Honduran Lempira (HNL).
			case hnl = "HNL"
		/// Hong Kong Dollars (HKD).
			case hkd = "HKD"
		/// Hungarian Forint (HUF).
			case huf = "HUF"
		/// Icelandic Kronur (ISK).
			case isk = "ISK"
		/// Indian Rupees (INR).
			case inr = "INR"
		/// Indonesian Rupiah (IDR).
			case idr = "IDR"
		/// Israeli New Shekel (NIS).
			case ils = "ILS"
		/// Iranian Rial (IRR).
			case irr = "IRR"
		/// Iraqi Dinar (IQD).
			case iqd = "IQD"
		/// Jamaican Dollars (JMD).
			case jmd = "JMD"
		/// Japanese Yen (JPY).
			case jpy = "JPY"
		/// Jersey Pound.
			case jep = "JEP"
		/// Jordanian Dinar (JOD).
			case jod = "JOD"
		/// Kazakhstani Tenge (KZT).
			case kzt = "KZT"
		/// Kenyan Shilling (KES).
			case kes = "KES"
		/// Kuwaiti Dinar (KWD).
			case kwd = "KWD"
		/// Kyrgyzstani Som (KGS).
			case kgs = "KGS"
		/// Laotian Kip (LAK).
			case lak = "LAK"
		/// Latvian Lati (LVL).
			case lvl = "LVL"
		/// Lebanese Pounds (LBP).
			case lbp = "LBP"
		/// Lesotho Loti (LSL).
			case lsl = "LSL"
		/// Liberian Dollar (LRD).
			case lrd = "LRD"
		/// Libyan Dinar (LYD).
			case lyd = "LYD"
		/// Lithuanian Litai (LTL).
			case ltl = "LTL"
		/// Malagasy Ariary (MGA).
			case mga = "MGA"
		/// Macedonia Denar (MKD).
			case mkd = "MKD"
		/// Macanese Pataca (MOP).
			case mop = "MOP"
		/// Malawian Kwacha (MWK).
			case mwk = "MWK"
		/// Maldivian Rufiyaa (MVR).
			case mvr = "MVR"
		/// Mexican Pesos (MXN).
			case mxn = "MXN"
		/// Malaysian Ringgits (MYR).
			case myr = "MYR"
		/// Mauritian Rupee (MUR).
			case mur = "MUR"
		/// Moldovan Leu (MDL).
			case mdl = "MDL"
		/// Moroccan Dirham.
			case mad = "MAD"
		/// Mongolian Tugrik.
			case mnt = "MNT"
		/// Mozambican Metical.
			case mzn = "MZN"
		/// Namibian Dollar.
			case nad = "NAD"
		/// Nepalese Rupee (NPR).
			case npr = "NPR"
		/// Netherlands Antillean Guilder.
			case ang = "ANG"
		/// New Zealand Dollars (NZD).
			case nzd = "NZD"
		/// Nicaraguan Córdoba (NIO).
			case nio = "NIO"
		/// Nigerian Naira (NGN).
			case ngn = "NGN"
		/// Norwegian Kroner (NOK).
			case nok = "NOK"
		/// Omani Rial (OMR).
			case omr = "OMR"
		/// Panamian Balboa (PAB).
			case pab = "PAB"
		/// Pakistani Rupee (PKR).
			case pkr = "PKR"
		/// Papua New Guinean Kina (PGK).
			case pgk = "PGK"
		/// Paraguayan Guarani (PYG).
			case pyg = "PYG"
		/// Peruvian Nuevo Sol (PEN).
			case pen = "PEN"
		/// Philippine Peso (PHP).
			case php = "PHP"
		/// Polish Zlotych (PLN).
			case pln = "PLN"
		/// Qatari Rial (QAR).
			case qar = "QAR"
		/// Romanian Lei (RON).
			case ron = "RON"
		/// Russian Rubles (RUB).
			case rub = "RUB"
		/// Rwandan Franc (RWF).
			case rwf = "RWF"
		/// Samoan Tala (WST).
			case wst = "WST"
		/// Saint Helena Pounds (SHP).
			case shp = "SHP"
		/// Saudi Riyal (SAR).
			case sar = "SAR"
		/// Sao Tome And Principe Dobra (STD).
			case std = "STD"
		/// Serbian dinar (RSD).
			case rsd = "RSD"
		/// Seychellois Rupee (SCR).
			case scr = "SCR"
		/// Sierra Leonean Leone (SLL).
			case sll = "SLL"
		/// Singapore Dollars (SGD).
			case sgd = "SGD"
		/// Sudanese Pound (SDG).
			case sdg = "SDG"
		/// Syrian Pound (SYP).
			case syp = "SYP"
		/// South African Rand (ZAR).
			case zar = "ZAR"
		/// South Korean Won (KRW).
			case krw = "KRW"
		/// South Sudanese Pound (SSP).
			case ssp = "SSP"
		/// Solomon Islands Dollar (SBD).
			case sbd = "SBD"
		/// Sri Lankan Rupees (LKR).
			case lkr = "LKR"
		/// Surinamese Dollar (SRD).
			case srd = "SRD"
		/// Swazi Lilangeni (SZL).
			case szl = "SZL"
		/// Swedish Kronor (SEK).
			case sek = "SEK"
		/// Swiss Francs (CHF).
			case chf = "CHF"
		/// Taiwan Dollars (TWD).
			case twd = "TWD"
		/// Thai baht (THB).
			case thb = "THB"
		/// Tajikistani Somoni (TJS).
			case tjs = "TJS"
		/// Tanzanian Shilling (TZS).
			case tzs = "TZS"
		/// Tongan Pa'anga (TOP).
			case top = "TOP"
		/// Trinidad and Tobago Dollars (TTD).
			case ttd = "TTD"
		/// Tunisian Dinar (TND).
			case tnd = "TND"
		/// Turkish Lira (TRY).
			case `try` = "TRY"
		/// Turkmenistani Manat (TMT).
			case tmt = "TMT"
		/// Ugandan Shilling (UGX).
			case ugx = "UGX"
		/// Ukrainian Hryvnia (UAH).
			case uah = "UAH"
		/// United Arab Emirates Dirham (AED).
			case aed = "AED"
		/// Uruguayan Pesos (UYU).
			case uyu = "UYU"
		/// Uzbekistan som (UZS).
			case uzs = "UZS"
		/// Vanuatu Vatu (VUV).
			case vuv = "VUV"
		/// Venezuelan Bolivares (VEF).
			case vef = "VEF"
		/// Vietnamese đồng (VND).
			case vnd = "VND"
		/// West African CFA franc (XOF).
			case xof = "XOF"
		/// Yemeni Rial (YER).
			case yer = "YER"
		/// Zambian Kwacha (ZMW).
			case zmw = "ZMW"
		case unknownValue = ""

		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let stringValue = try container.decode(String.self)
			if let value = CurrencyCode(rawValue: stringValue) {
				self = value
			} else {
				self = .unknownValue
			}
		}

		public static var allCases: [CurrencyCode] = [
			.usd,
			.eur,
			.gbp,
			.cad,
			.afn,
			.all,
			.dzd,
			.aoa,
			.ars,
			.amd,
			.awg,
			.aud,
			.bbd,
			.azn,
			.bdt,
			.bsd,
			.bhd,
			.bif,
			.byn,
			.byr,
			.bzd,
			.bmd,
			.btn,
			.bam,
			.brl,
			.bob,
			.bwp,
			.bnd,
			.bgn,
			.mmk,
			.khr,
			.cve,
			.kyd,
			.xaf,
			.clp,
			.cny,
			.cop,
			.kmf,
			.cdf,
			.crc,
			.hrk,
			.czk,
			.dkk,
			.djf,
			.dop,
			.xcd,
			.egp,
			.etb,
			.fkp,
			.xpf,
			.fjd,
			.gip,
			.gmd,
			.ghs,
			.gtq,
			.gyd,
			.gel,
			.gnf,
			.htg,
			.hnl,
			.hkd,
			.huf,
			.isk,
			.inr,
			.idr,
			.ils,
			.irr,
			.iqd,
			.jmd,
			.jpy,
			.jep,
			.jod,
			.kzt,
			.kes,
			.kwd,
			.kgs,
			.lak,
			.lvl,
			.lbp,
			.lsl,
			.lrd,
			.lyd,
			.ltl,
			.mga,
			.mkd,
			.mop,
			.mwk,
			.mvr,
			.mxn,
			.myr,
			.mur,
			.mdl,
			.mad,
			.mnt,
			.mzn,
			.nad,
			.npr,
			.ang,
			.nzd,
			.nio,
			.ngn,
			.nok,
			.omr,
			.pab,
			.pkr,
			.pgk,
			.pyg,
			.pen,
			.php,
			.pln,
			.qar,
			.ron,
			.rub,
			.rwf,
			.wst,
			.shp,
			.sar,
			.std,
			.rsd,
			.scr,
			.sll,
			.sgd,
			.sdg,
			.syp,
			.zar,
			.krw,
			.ssp,
			.sbd,
			.lkr,
			.srd,
			.szl,
			.sek,
			.chf,
			.twd,
			.thb,
			.tjs,
			.tzs,
			.top,
			.ttd,
			.tnd,
			.`try`,
			.tmt,
			.ugx,
			.uah,
			.aed,
			.uyu,
			.uzs,
			.vuv,
			.vef,
			.vnd,
			.xof,
			.yer,
			.zmw,
		]
	}
}
