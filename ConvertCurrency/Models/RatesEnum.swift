//
//  RatesEnum.swift
//  ConvertCurrency
//  Created by George Kye on 2016-08-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
import UIKit

var lightGreen = UIColor(colorLiteralRed: 83/255, green: 195/255, blue: 135/255, alpha: 1)
var lightRed = UIColor(colorLiteralRed: 198/255, green: 60/255, blue: 89/255, alpha: 1)
enum RatesEnum: String{
  case AUD
  case BGN
  case BRL
  case CAD
  case CHF
  case CNY
  case CZK
  case DKK
  case GBP
  case HKD
  case HRK
  case HUF
  case IDR
  case ILS
  case INR
  case JPY
  case KRW
  case MXN
  case MYR
  case NOK
  case NZD
  case PHP
  case PLN
  case RON
  case RUB
  case SEK
  case SGD
  case THB
  case TRY
  case ZAR
  case EUR
  case USD
  
  func getRate(_ json: JSON)->RateBase?{
    if let json = json[self.rawValue].double{
      return (json, self.rawValue, "")
    }else{
      return nil
    }
  }
}
