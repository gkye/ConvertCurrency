//
//  FlagSelectionViewController.swift
//  ConvertCurrency
//
//  Created by George Kye on 2016-08-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
import UIKit

enum SelectedFlagDirection{
  case leftFlag, rightFlag
}

protocol FlagSelectionDelegate: class {
  func didSelect(direction: SelectedFlagDirection, value: enumArray)
}

class FlagSelectionViewController: UITableViewController{
  
  var selectedFlag: SelectedFlagDirection!
  weak var delegate: FlagSelectionDelegate?
  
  override func viewDidLoad() {
    let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismiss(sender:)))
    navigationItem.leftBarButtonItem = cancelBtn
  }
  
  
  func dismiss(sender: AnyObject){
    self.navigationController?.dismiss(animated: true, completion: nil)
  }
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return RatesEnumArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.imageView?.image = UIImage(named: RatesEnumArray[indexPath.row].rateE.rawValue)
    cell.textLabel?.text = RatesEnumArray[indexPath.row].string
    cell.detailTextLabel?.text = RatesEnumArray[indexPath.row].rateE.rawValue
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.navigationController?.dismiss(animated: true, completion: {
      self.delegate?.didSelect(direction: self.selectedFlag, value:  RatesEnumArray[indexPath.row])
    })
  }
}
