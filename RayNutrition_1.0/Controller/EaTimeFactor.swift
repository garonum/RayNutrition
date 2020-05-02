//
//  File.swift
//  RayOfReturn
//
//  Created by LA'D on 15.02.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class EaTimeFactor: BaseCell,
UIPickerViewDelegate, UIPickerViewDataSource {
    
  
    var indexPath: IP? {
          didSet {
              
            ip = indexPath?.iP
              
          }
      }
    
    var ip : IndexPath!
    
    override func setupViews() {
   
          UIPicker.delegate = self as UIPickerViewDelegate
          UIPicker.dataSource = self as UIPickerViewDataSource
         
          addSubview(gradeTextField)
          
          gradeTextField.inputView = UIPicker
          gradeTextField.text = dataArray[0]
          setupButton()
          
      }
    
    let dataArray = ["От 1 с - до 5 мин", "От 5 мин - до 20 мин", "От 20 мин - до 1 ч", "От 1 ч - до 2 ч", "От 2 ч - до 6 ч", "От 6 ч - до 24 ч", "От 1 дня - до 2 дней", "От 2 дней - до 5 дней", "От 5 дней - до 7 дней", "От 1 недели - до 1 месяца", "От 1 месяца - до 6 мес.", "От 6 мес - до 12 мес", "более года"]
    
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
      }
    
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
         return dataArray.count
      }
    
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gradeTextField.text = dataArray[row]
         let row = dataArray[row]
         return row
      }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
         gradeTextField.text = dataArray[row]
        
        G_Res.oneMoreSI(indexPath: [gradeTextField.tag,row])
        
         self.endEditing(true)
     }
    
    var rayOfReturn: Slices? {
        didSet {
//            titleLabel.text = rayOfReturn?.productsName
//            platName.text = rayOfReturn?.platName
//            directionOfObservation.text = rayOfReturn?.directionOfObservation

            
        }
    }
    
   let gradeTextField: UITextField = {
        let UIPicker = UITextField(frame: CGRect(x: 20, y: 15, width: 300, height: 40))
    UIPicker.tag = 0
        //UIPicker.placeholder = "Enter text here"
        UIPicker.font = UIFont.systemFont(ofSize: 15)
        UIPicker.borderStyle = UITextField.BorderStyle.roundedRect
        //UIPicker.isUserInteractionEnabled = false
        //UIPicker.autocorrectionType = UITextAutocorrectionType.no
        //UIPicker.keyboardType = UIKeyboardType.default
        //UIPicker.returnKeyType = UIReturnKeyType.done
        //UIPicker.clearButtonMode = UITextField.ViewMode.whileEditing
        UIPicker.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return UIPicker
    
   }()
    
    let UIPicker: UIPickerView = {
        
        let UIPicker: UIPickerView = UIPickerView()

        return UIPicker
       }()
    
 
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    func setupButton(){
        
           let button = UIButton.init(type: .system)
              button.frame = CGRect(x: 50.0, y: 75.0, width: 200.0, height: 52.0)
              button.layer.borderWidth = 5.0
              button.layer.borderColor = UIColor.white.cgColor
              button.backgroundColor = UIColor.green
              button.titleLabel?.textColor = UIColor.black
              button.tintColor = UIColor.white
              button.layer.cornerRadius = 15.0
               button.setTitle("Добавить", for: .normal)
               button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
            addSubview(button)
       }
    
       @objc func buttonClicked() {

        NotificationCenter.default.post(name: NSNotification.Name("Луч Земли"), object: nil)
       
        
       }
   
    
  
   
   
}


