//
//  RateModel.swift
//  ConvertCurrency
//
//  Created by George Kye on 2016-08-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

internal typealias enumArray = (rateE: RatesEnum, string: String)
var RatesEnumArray: [enumArray] = [(.USD, "US Dollar"), (.AUD, "Australian Dollar"), (.BGN, "Bulgarian Lev"), (.BRL, "Brazilian Real"), (.CAD, "Canadian Dollar"), (.CHF, "Swiss Franc"), (.CNY, "Chinese Yuan"), (.CZK, "Czech Republic Koruna"), (.DKK, "Danish Krone"), (.EUR, "Euro"), (.GBP, "British Pound Sterling"), (.HKD, "Hong Kong Dollar"), (.HRK, "Croatian Kuna"), (.HUF, "Hungarian Forint"), (.IDR, "Indonesian Rupiah"), (.ILS, "Israeli New Sheqel"), (.INR, "Indian Rupee"), (.JPY, "Japanese Yen"), (.KRW, "South Korean Won"), (.MXN, "Mexican Peso"), (.MYR, "Malaysian Ringgit"), (.NOK, "Norwegian Krone"), (.NZD, "New Zealand Dollar"), (.PHP, "Philippine Peso"), (.PLN, "Polish Zloty"), (.RON, "Romanian Leu"), (.RUB, "Russian Ruble"), (.SEK, "Swedish Krona"), (.SGD, "Singapore Dollar"), (.THB, "Thai Baht"), (.TRY, "Turkish Lira"), (.ZAR, "South African Rand")]

typealias RateBase = (rate: Double?, currencyCode: String, currencyName: String)
struct RateModel{
  
  var base: String!
  var AUD: RateBase!
  var BGN: RateBase!
  var BRL: RateBase!
  var CAD: RateBase!
  var CHF: RateBase!
  var CNY: RateBase!
  var CZK: RateBase!
  var DKK: RateBase!
  var GBP: RateBase!
  var HKD: RateBase!
  var HRK: RateBase!
  var HUF: RateBase!
  var IDR: RateBase!
  var ILS: RateBase!
  var INR: RateBase!
  var JPY: RateBase!
  var KRW: RateBase!
  var MXN: RateBase!
  var MYR: RateBase!
  var NOK: RateBase!
  var NZD: RateBase!
  var PHP: RateBase!
  var PLN: RateBase!
  var RON: RateBase!
  var RUB: RateBase!
  var SEK: RateBase!
  var SGD: RateBase!
  var THB: RateBase!
  var TRY: RateBase!
  var ZAR: RateBase! 
  var EUR: RateBase!

  init(json: JSON){
    AUD = (json["AUD"].double, "AUD", "Australian Dollar")
    BGN = (json["BGN"].double, "BGN", "Bulgarian Lev")
    BRL = (json["BRL"].double, "BRL", "Brazilian Real")
    CAD = (json["CAD"].double, "CAD", "Canadian Dollar")
    CHF = (json["CHF"].double, "CHF", "Swiss Franc")
    CNY = (json["CNY"].double, "CNY", "Chinese Yuan")
    CZK = (json["CZK"].double, "CZK", "Czech Republic Koruna")
    DKK = (json["DKK"].double, "DKK", "Danish Krone")
    EUR = (json["EUR"].double, "EUR", "Euro")
    GBP = (json["GBP"].double, "GBP", "British Pound Sterling")
    HKD = (json["HKD"].double, "HKD", "Hong Kong Dollar")
    HRK = (json["HRK"].double, "HRK", "Croatian Kuna")
    HUF = (json["HUF"].double, "HUF", "Hungarian Forint")
    IDR = (json["IDR"].double, "IDR", "Indonesian Rupiah")
    ILS = (json["ILS"].double, "ILS", "Israeli New Sheqel")
    INR = (json["INR"].double, "INR", "Indian Rupee")
    JPY = (json["JPY"].double, "JPY", "Japanese Yen")
    KRW = (json["KRW"].double, "KRW", "South Korean Won")
    MXN = (json["MXN"].double, "MXN", "Mexican Peso")
    MYR = (json["MYR"].double, "MYR", "Malaysian Ringgit")
    NOK = (json["NOK"].double, "NOK", "Norwegian Krone")
    NZD = (json["NZD"].double, "NZD", "New Zealand Dollar")
    PHP = (json["PHP"].double, "PHP", "Philippine Peso")
    PLN = (json["PLN"].double, "PLN", "Polish Zloty")
    RON = (json["RON"].double, "RON", "Romanian Leu")
    RUB = (json["RUB"].double, "RUB", "Russian Ruble")
    SEK = (json["SEK"].double, "SEK", "Swedish Krona")
    SGD = (json["SGD"].double, "SGD", "Singapore Dollar")
    THB = (json["THB"].double, "THB", "Thai Baht")
    TRY = (json["TRY"].double, "TRY", "Turkish Lira")
    ZAR = (json["ZAR"].double, "ZAR", "South African Rand")
  }
  
}


