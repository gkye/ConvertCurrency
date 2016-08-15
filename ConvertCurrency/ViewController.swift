//
//  ViewController.swift
//  ConvertCurrency
//
//  Created by George Kye on 2016-08-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var dataSource = ["7", "8", "9", "C", "4", "5", "6", "Back", "1", "2", "3", "switch","0", "."]
  var requestBase: String = "USD"
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var baseValue: UILabel!
  var model: RateModel!
  var json: JSON!
  
  var typedValue: String!{
    didSet{
      if typedValue == nil{
        leftLabel.text = "0"
        rightLabel.text = "0"
      }else{
        leftLabel.text = typedValue
        calculateExchange()
      }
    }
  }
  
  //MARK: - Left values
  @IBOutlet var leftLabel: UILabel!
  @IBOutlet var leftFlag: UIButton!
  @IBOutlet var leftFlagLbl: UILabel!
  var leftCurrency: RateBase!
  var leftBaseCurrencyEnum: RatesEnum! = .USD{
    didSet{
      leftFlag.setImage(UIImage(named: leftBaseCurrencyEnum.rawValue), for: .normal)
      leftFlagLbl.text = leftBaseCurrencyEnum.rawValue
    }
  }
  
  
  
  //MARK: - Right values
  @IBOutlet var rightLabel: UILabel!
  @IBOutlet var rightFlag: UIButton!
  @IBOutlet var rightFlagLbl: UILabel!
  var rightCurrency: RateBase!
  var rightBaseCurrencyEnum: RatesEnum! = .CAD{
    didSet{
      rightFlag.setImage(UIImage(named: rightBaseCurrencyEnum.rawValue), for: .normal)
      rightFlagLbl.text = rightBaseCurrencyEnum.rawValue
    }
  }
  
  var convertedValue: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    collectionView.delegate = self
    leftBaseCurrencyEnum = .USD
    rightBaseCurrencyEnum = .CAD
    loadData()
  }
  
  func loadData(){
    Request.getRequest(base: requestBase){
      if let _ = $0.json{
        self.model = $0.0
        self.json = $0.json
        self.setLabels()
        self.calculateExchange()
      }
    }
  }
  
  //MARK: - Update labels
  func setLabels(){
    if let cur = self.rightBaseCurrencyEnum.getRate(json: json["rates"]){
      self.rightCurrency = cur
    }
    self.baseValue.text = "1 \(json["base"].string!) = \(rightCurrency.rate!) \(self.rightBaseCurrencyEnum.rawValue)"
  }
  
  //MARK: - Calculate Exchange Rate
  func calculateExchange(){
    if let value = typedValue{
      if let dblValue = Double(value){
        var exchange =  dblValue * rightCurrency.rate!
        exchange = round(1000 * exchange) / 1000
        rightLabel.text = String(exchange)
      }
     
    }
  }
  
  
  func switchValues(){
    requestBase = rightBaseCurrencyEnum.rawValue
    let right = leftBaseCurrencyEnum
    let left = rightBaseCurrencyEnum
    leftBaseCurrencyEnum = left
    rightBaseCurrencyEnum = right
    loadData()
  }
  
  //MARK: - IBAction
  
  @IBAction func didSelectFlag(sender: UIButton){
    let direction: SelectedFlagDirection
    if sender.tag == 0 {
      direction = .leftFlag
    }else{
      direction = .rightFlag
    }
    let vc = FlagSelectionViewController()
    vc.selectedFlag = direction
    vc.delegate = self
    let nav = UINavigationController(rootViewController: vc)
    self.present(nav, animated: true, completion: nil)
  }
}

extension ViewController: FlagSelectionDelegate{
  func didSelect(direction: SelectedFlagDirection, value: enumArray) {
    if direction == .leftFlag{
      requestBase = value.rateE.rawValue
      leftBaseCurrencyEnum = value.rateE
      loadData()
    }else{
      if value.rateE == leftBaseCurrencyEnum{
        rightCurrency = (1, value.rateE.rawValue, "")
      }else{
        rightCurrency = value.rateE.getRate(json: json["rates"])
      }
      rightBaseCurrencyEnum = value.rateE
      setLabels()
      calculateExchange()
    }
  }
}

extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! KeyboardCell
    switch indexPath.row{
    case 3:
      cell.button.setTitleColor(.purple, for: .normal)
      cell.button.setTitle(dataSource[indexPath.row], for: .normal)
      cell.button.setImage(nil, for: .normal)
    case 7:
      cell.button.setImage(#imageLiteral(resourceName: "undo"), for: .normal)
      cell.button.setTitle(nil, for: .normal)
      cell.backgroundColor = .lightGray
    case 11:
      cell.button.setImage(#imageLiteral(resourceName: "sorting_arrows"), for: .normal)
      cell.backgroundColor = lightGreen
      cell.button.setTitle(nil, for: .normal)
    default:
      cell.button.setTitle(dataSource[indexPath.row], for: .normal)
      cell.button.setImage(nil, for: .normal)
      cell.backgroundColor = .clear
    }
    
    cell.button.tintColor = .clear
    cell.layer.borderWidth = 0.5
    cell.layer.borderColor = UIColor.lightGray.cgColor
    cell.button.isUserInteractionEnabled = false
    //cell.button.imageView?.contentMode = .scaleAspectFill
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.row == 13 || indexPath.row == 12  {
      let width = collectionView.bounds.width / 2
      return CGSize(width: width, height: collectionView.bounds.height / 4)
    }
    return CGSize(width: collectionView.bounds.width / 4, height: collectionView.bounds.height / 4)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(dataSource[indexPath.row], indexPath.row)
    let cell = collectionView.cellForItem(at: indexPath)
    cell?.pop()
    switch indexPath.row {
    case 3:
      typedValue = nil
    case 11:
      switchValues()
    case 13:
      if typedValue != nil{
        if typedValue.characters.count >= 1 && typedValue.contains(".") == false{
          typedValue =  typedValue + dataSource[indexPath.row]
        }
      }
    case 7:
      if typedValue != nil{
        typedValue.characters.removeLast()
        if typedValue.characters.count == 0{
          typedValue = nil
        }
      }
    default:
      if let value = typedValue{
        typedValue =  value + dataSource[indexPath.row]
      }
      
      if typedValue == nil{
        
        typedValue = dataSource[indexPath.row]
      }
    }
    
  }
}

class KeyboardCell: UICollectionViewCell{
  
  @IBOutlet var button: UIButton!
}

