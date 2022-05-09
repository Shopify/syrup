
@file:Suppress("UNUSED_PARAMETER")
package com.shopify.syrup.enums

import com.shopify.foundation.syrupsupport.*
import com.google.gson.annotations.SerializedName
import javax.annotation.Generated

@Generated("com.shopify.syrup")
enum class CurrencyCode(val value: String) {

    /**
     * United States Dollars (USD).
     */
    @SerializedName("USD")
    USD("USD"),

    /**
     * Euro (EUR).
     */
    @SerializedName("EUR")
    EUR("EUR"),

    /**
     * United Kingdom Pounds (GBP).
     */
    @SerializedName("GBP")
    GBP("GBP"),

    /**
     * Canadian Dollars (CAD).
     */
    @SerializedName("CAD")
    CAD("CAD"),

    /**
     * Afghan Afghani (AFN).
     */
    @SerializedName("AFN")
    AFN("AFN"),

    /**
     * Albanian Lek (ALL).
     */
    @SerializedName("ALL")
    ALL("ALL"),

    /**
     * Algerian Dinar (DZD).
     */
    @SerializedName("DZD")
    DZD("DZD"),

    /**
     * Angolan Kwanza (AOA).
     */
    @SerializedName("AOA")
    AOA("AOA"),

    /**
     * Argentine Pesos (ARS).
     */
    @SerializedName("ARS")
    ARS("ARS"),

    /**
     * Armenian Dram (AMD).
     */
    @SerializedName("AMD")
    AMD("AMD"),

    /**
     * Aruban Florin (AWG).
     */
    @SerializedName("AWG")
    AWG("AWG"),

    /**
     * Australian Dollars (AUD).
     */
    @SerializedName("AUD")
    AUD("AUD"),

    /**
     * Barbadian Dollar (BBD).
     */
    @SerializedName("BBD")
    BBD("BBD"),

    /**
     * Azerbaijani Manat (AZN).
     */
    @SerializedName("AZN")
    AZN("AZN"),

    /**
     * Bangladesh Taka (BDT).
     */
    @SerializedName("BDT")
    BDT("BDT"),

    /**
     * Bahamian Dollar (BSD).
     */
    @SerializedName("BSD")
    BSD("BSD"),

    /**
     * Bahraini Dinar (BHD).
     */
    @SerializedName("BHD")
    BHD("BHD"),

    /**
     * Burundian Franc (BIF).
     */
    @SerializedName("BIF")
    BIF("BIF"),

    /**
     * Belarusian Ruble (BYN).
     */
    @SerializedName("BYN")
    BYN("BYN"),

    /**
     * Belarusian Ruble (BYR).
     */
    @Deprecated("""`BYR` is deprecated. Use `BYN` available from version `2019-10` onwards instead.""")
    @SerializedName("BYR")
    BYR("BYR"),

    /**
     * Belize Dollar (BZD).
     */
    @SerializedName("BZD")
    BZD("BZD"),

    /**
     * Bermudian Dollar (BMD).
     */
    @SerializedName("BMD")
    BMD("BMD"),

    /**
     * Bhutanese Ngultrum (BTN).
     */
    @SerializedName("BTN")
    BTN("BTN"),

    /**
     * Bosnia and Herzegovina Convertible Mark (BAM).
     */
    @SerializedName("BAM")
    BAM("BAM"),

    /**
     * Brazilian Real (BRL).
     */
    @SerializedName("BRL")
    BRL("BRL"),

    /**
     * Bolivian Boliviano (BOB).
     */
    @SerializedName("BOB")
    BOB("BOB"),

    /**
     * Botswana Pula (BWP).
     */
    @SerializedName("BWP")
    BWP("BWP"),

    /**
     * Brunei Dollar (BND).
     */
    @SerializedName("BND")
    BND("BND"),

    /**
     * Bulgarian Lev (BGN).
     */
    @SerializedName("BGN")
    BGN("BGN"),

    /**
     * Burmese Kyat (MMK).
     */
    @SerializedName("MMK")
    MMK("MMK"),

    /**
     * Cambodian Riel.
     */
    @SerializedName("KHR")
    KHR("KHR"),

    /**
     * Cape Verdean escudo (CVE).
     */
    @SerializedName("CVE")
    CVE("CVE"),

    /**
     * Cayman Dollars (KYD).
     */
    @SerializedName("KYD")
    KYD("KYD"),

    /**
     * Central African CFA Franc (XAF).
     */
    @SerializedName("XAF")
    XAF("XAF"),

    /**
     * Chilean Peso (CLP).
     */
    @SerializedName("CLP")
    CLP("CLP"),

    /**
     * Chinese Yuan Renminbi (CNY).
     */
    @SerializedName("CNY")
    CNY("CNY"),

    /**
     * Colombian Peso (COP).
     */
    @SerializedName("COP")
    COP("COP"),

    /**
     * Comorian Franc (KMF).
     */
    @SerializedName("KMF")
    KMF("KMF"),

    /**
     * Congolese franc (CDF).
     */
    @SerializedName("CDF")
    CDF("CDF"),

    /**
     * Costa Rican Colones (CRC).
     */
    @SerializedName("CRC")
    CRC("CRC"),

    /**
     * Croatian Kuna (HRK).
     */
    @SerializedName("HRK")
    HRK("HRK"),

    /**
     * Czech Koruny (CZK).
     */
    @SerializedName("CZK")
    CZK("CZK"),

    /**
     * Danish Kroner (DKK).
     */
    @SerializedName("DKK")
    DKK("DKK"),

    /**
     * Djiboutian Franc (DJF).
     */
    @SerializedName("DJF")
    DJF("DJF"),

    /**
     * Dominican Peso (DOP).
     */
    @SerializedName("DOP")
    DOP("DOP"),

    /**
     * East Caribbean Dollar (XCD).
     */
    @SerializedName("XCD")
    XCD("XCD"),

    /**
     * Egyptian Pound (EGP).
     */
    @SerializedName("EGP")
    EGP("EGP"),

    /**
     * Ethiopian Birr (ETB).
     */
    @SerializedName("ETB")
    ETB("ETB"),

    /**
     * Falkland Islands Pounds (FKP).
     */
    @SerializedName("FKP")
    FKP("FKP"),

    /**
     * CFP Franc (XPF).
     */
    @SerializedName("XPF")
    XPF("XPF"),

    /**
     * Fijian Dollars (FJD).
     */
    @SerializedName("FJD")
    FJD("FJD"),

    /**
     * Gibraltar Pounds (GIP).
     */
    @SerializedName("GIP")
    GIP("GIP"),

    /**
     * Gambian Dalasi (GMD).
     */
    @SerializedName("GMD")
    GMD("GMD"),

    /**
     * Ghanaian Cedi (GHS).
     */
    @SerializedName("GHS")
    GHS("GHS"),

    /**
     * Guatemalan Quetzal (GTQ).
     */
    @SerializedName("GTQ")
    GTQ("GTQ"),

    /**
     * Guyanese Dollar (GYD).
     */
    @SerializedName("GYD")
    GYD("GYD"),

    /**
     * Georgian Lari (GEL).
     */
    @SerializedName("GEL")
    GEL("GEL"),

    /**
     * Guinean Franc (GNF).
     */
    @SerializedName("GNF")
    GNF("GNF"),

    /**
     * Haitian Gourde (HTG).
     */
    @SerializedName("HTG")
    HTG("HTG"),

    /**
     * Honduran Lempira (HNL).
     */
    @SerializedName("HNL")
    HNL("HNL"),

    /**
     * Hong Kong Dollars (HKD).
     */
    @SerializedName("HKD")
    HKD("HKD"),

    /**
     * Hungarian Forint (HUF).
     */
    @SerializedName("HUF")
    HUF("HUF"),

    /**
     * Icelandic Kronur (ISK).
     */
    @SerializedName("ISK")
    ISK("ISK"),

    /**
     * Indian Rupees (INR).
     */
    @SerializedName("INR")
    INR("INR"),

    /**
     * Indonesian Rupiah (IDR).
     */
    @SerializedName("IDR")
    IDR("IDR"),

    /**
     * Israeli New Shekel (NIS).
     */
    @SerializedName("ILS")
    ILS("ILS"),

    /**
     * Iranian Rial (IRR).
     */
    @SerializedName("IRR")
    IRR("IRR"),

    /**
     * Iraqi Dinar (IQD).
     */
    @SerializedName("IQD")
    IQD("IQD"),

    /**
     * Jamaican Dollars (JMD).
     */
    @SerializedName("JMD")
    JMD("JMD"),

    /**
     * Japanese Yen (JPY).
     */
    @SerializedName("JPY")
    JPY("JPY"),

    /**
     * Jersey Pound.
     */
    @SerializedName("JEP")
    JEP("JEP"),

    /**
     * Jordanian Dinar (JOD).
     */
    @SerializedName("JOD")
    JOD("JOD"),

    /**
     * Kazakhstani Tenge (KZT).
     */
    @SerializedName("KZT")
    KZT("KZT"),

    /**
     * Kenyan Shilling (KES).
     */
    @SerializedName("KES")
    KES("KES"),

    /**
     * Kuwaiti Dinar (KWD).
     */
    @SerializedName("KWD")
    KWD("KWD"),

    /**
     * Kyrgyzstani Som (KGS).
     */
    @SerializedName("KGS")
    KGS("KGS"),

    /**
     * Laotian Kip (LAK).
     */
    @SerializedName("LAK")
    LAK("LAK"),

    /**
     * Latvian Lati (LVL).
     */
    @SerializedName("LVL")
    LVL("LVL"),

    /**
     * Lebanese Pounds (LBP).
     */
    @SerializedName("LBP")
    LBP("LBP"),

    /**
     * Lesotho Loti (LSL).
     */
    @SerializedName("LSL")
    LSL("LSL"),

    /**
     * Liberian Dollar (LRD).
     */
    @SerializedName("LRD")
    LRD("LRD"),

    /**
     * Libyan Dinar (LYD).
     */
    @SerializedName("LYD")
    LYD("LYD"),

    /**
     * Lithuanian Litai (LTL).
     */
    @SerializedName("LTL")
    LTL("LTL"),

    /**
     * Malagasy Ariary (MGA).
     */
    @SerializedName("MGA")
    MGA("MGA"),

    /**
     * Macedonia Denar (MKD).
     */
    @SerializedName("MKD")
    MKD("MKD"),

    /**
     * Macanese Pataca (MOP).
     */
    @SerializedName("MOP")
    MOP("MOP"),

    /**
     * Malawian Kwacha (MWK).
     */
    @SerializedName("MWK")
    MWK("MWK"),

    /**
     * Maldivian Rufiyaa (MVR).
     */
    @SerializedName("MVR")
    MVR("MVR"),

    /**
     * Mexican Pesos (MXN).
     */
    @SerializedName("MXN")
    MXN("MXN"),

    /**
     * Malaysian Ringgits (MYR).
     */
    @SerializedName("MYR")
    MYR("MYR"),

    /**
     * Mauritian Rupee (MUR).
     */
    @SerializedName("MUR")
    MUR("MUR"),

    /**
     * Moldovan Leu (MDL).
     */
    @SerializedName("MDL")
    MDL("MDL"),

    /**
     * Moroccan Dirham.
     */
    @SerializedName("MAD")
    MAD("MAD"),

    /**
     * Mongolian Tugrik.
     */
    @SerializedName("MNT")
    MNT("MNT"),

    /**
     * Mozambican Metical.
     */
    @SerializedName("MZN")
    MZN("MZN"),

    /**
     * Namibian Dollar.
     */
    @SerializedName("NAD")
    NAD("NAD"),

    /**
     * Nepalese Rupee (NPR).
     */
    @SerializedName("NPR")
    NPR("NPR"),

    /**
     * Netherlands Antillean Guilder.
     */
    @SerializedName("ANG")
    ANG("ANG"),

    /**
     * New Zealand Dollars (NZD).
     */
    @SerializedName("NZD")
    NZD("NZD"),

    /**
     * Nicaraguan Córdoba (NIO).
     */
    @SerializedName("NIO")
    NIO("NIO"),

    /**
     * Nigerian Naira (NGN).
     */
    @SerializedName("NGN")
    NGN("NGN"),

    /**
     * Norwegian Kroner (NOK).
     */
    @SerializedName("NOK")
    NOK("NOK"),

    /**
     * Omani Rial (OMR).
     */
    @SerializedName("OMR")
    OMR("OMR"),

    /**
     * Panamian Balboa (PAB).
     */
    @SerializedName("PAB")
    PAB("PAB"),

    /**
     * Pakistani Rupee (PKR).
     */
    @SerializedName("PKR")
    PKR("PKR"),

    /**
     * Papua New Guinean Kina (PGK).
     */
    @SerializedName("PGK")
    PGK("PGK"),

    /**
     * Paraguayan Guarani (PYG).
     */
    @SerializedName("PYG")
    PYG("PYG"),

    /**
     * Peruvian Nuevo Sol (PEN).
     */
    @SerializedName("PEN")
    PEN("PEN"),

    /**
     * Philippine Peso (PHP).
     */
    @SerializedName("PHP")
    PHP("PHP"),

    /**
     * Polish Zlotych (PLN).
     */
    @SerializedName("PLN")
    PLN("PLN"),

    /**
     * Qatari Rial (QAR).
     */
    @SerializedName("QAR")
    QAR("QAR"),

    /**
     * Romanian Lei (RON).
     */
    @SerializedName("RON")
    RON("RON"),

    /**
     * Russian Rubles (RUB).
     */
    @SerializedName("RUB")
    RUB("RUB"),

    /**
     * Rwandan Franc (RWF).
     */
    @SerializedName("RWF")
    RWF("RWF"),

    /**
     * Samoan Tala (WST).
     */
    @SerializedName("WST")
    WST("WST"),

    /**
     * Saint Helena Pounds (SHP).
     */
    @SerializedName("SHP")
    SHP("SHP"),

    /**
     * Saudi Riyal (SAR).
     */
    @SerializedName("SAR")
    SAR("SAR"),

    /**
     * Sao Tome And Principe Dobra (STD).
     */
    @SerializedName("STD")
    STD("STD"),

    /**
     * Serbian dinar (RSD).
     */
    @SerializedName("RSD")
    RSD("RSD"),

    /**
     * Seychellois Rupee (SCR).
     */
    @SerializedName("SCR")
    SCR("SCR"),

    /**
     * Sierra Leonean Leone (SLL).
     */
    @SerializedName("SLL")
    SLL("SLL"),

    /**
     * Singapore Dollars (SGD).
     */
    @SerializedName("SGD")
    SGD("SGD"),

    /**
     * Sudanese Pound (SDG).
     */
    @SerializedName("SDG")
    SDG("SDG"),

    /**
     * Syrian Pound (SYP).
     */
    @SerializedName("SYP")
    SYP("SYP"),

    /**
     * South African Rand (ZAR).
     */
    @SerializedName("ZAR")
    ZAR("ZAR"),

    /**
     * South Korean Won (KRW).
     */
    @SerializedName("KRW")
    KRW("KRW"),

    /**
     * South Sudanese Pound (SSP).
     */
    @SerializedName("SSP")
    SSP("SSP"),

    /**
     * Solomon Islands Dollar (SBD).
     */
    @SerializedName("SBD")
    SBD("SBD"),

    /**
     * Sri Lankan Rupees (LKR).
     */
    @SerializedName("LKR")
    LKR("LKR"),

    /**
     * Surinamese Dollar (SRD).
     */
    @SerializedName("SRD")
    SRD("SRD"),

    /**
     * Swazi Lilangeni (SZL).
     */
    @SerializedName("SZL")
    SZL("SZL"),

    /**
     * Swedish Kronor (SEK).
     */
    @SerializedName("SEK")
    SEK("SEK"),

    /**
     * Swiss Francs (CHF).
     */
    @SerializedName("CHF")
    CHF("CHF"),

    /**
     * Taiwan Dollars (TWD).
     */
    @SerializedName("TWD")
    TWD("TWD"),

    /**
     * Thai baht (THB).
     */
    @SerializedName("THB")
    THB("THB"),

    /**
     * Tajikistani Somoni (TJS).
     */
    @SerializedName("TJS")
    TJS("TJS"),

    /**
     * Tanzanian Shilling (TZS).
     */
    @SerializedName("TZS")
    TZS("TZS"),

    /**
     * Tongan Pa'anga (TOP).
     */
    @SerializedName("TOP")
    TOP("TOP"),

    /**
     * Trinidad and Tobago Dollars (TTD).
     */
    @SerializedName("TTD")
    TTD("TTD"),

    /**
     * Tunisian Dinar (TND).
     */
    @SerializedName("TND")
    TND("TND"),

    /**
     * Turkish Lira (TRY).
     */
    @SerializedName("TRY")
    TRY("TRY"),

    /**
     * Turkmenistani Manat (TMT).
     */
    @SerializedName("TMT")
    TMT("TMT"),

    /**
     * Ugandan Shilling (UGX).
     */
    @SerializedName("UGX")
    UGX("UGX"),

    /**
     * Ukrainian Hryvnia (UAH).
     */
    @SerializedName("UAH")
    UAH("UAH"),

    /**
     * United Arab Emirates Dirham (AED).
     */
    @SerializedName("AED")
    AED("AED"),

    /**
     * Uruguayan Pesos (UYU).
     */
    @SerializedName("UYU")
    UYU("UYU"),

    /**
     * Uzbekistan som (UZS).
     */
    @SerializedName("UZS")
    UZS("UZS"),

    /**
     * Vanuatu Vatu (VUV).
     */
    @SerializedName("VUV")
    VUV("VUV"),

    /**
     * Venezuelan Bolivares (VEF).
     */
    @SerializedName("VEF")
    VEF("VEF"),

    /**
     * Vietnamese đồng (VND).
     */
    @SerializedName("VND")
    VND("VND"),

    /**
     * West African CFA franc (XOF).
     */
    @SerializedName("XOF")
    XOF("XOF"),

    /**
     * Yemeni Rial (YER).
     */
    @SerializedName("YER")
    YER("YER"),

    /**
     * Zambian Kwacha (ZMW).
     */
    @SerializedName("ZMW")
    ZMW("ZMW"),

    UNKNOWN_SYRUP_ENUM("UNKNOWN_SYRUP_ENUM");

    companion object {
        fun safeValueOf(name: String): CurrencyCode = CurrencyCode.values().firstOrNull { it.value == name } ?: CurrencyCode.UNKNOWN_SYRUP_ENUM
    }
}
