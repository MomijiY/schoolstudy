//
//  TextviewViewController.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/30.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class TextviewViewController: ViewController {
    
    @IBOutlet weak var InputTextField: UITextField!
    
    private var datePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        InputTextField.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(TextviewViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer[target: self, action: #selector(ViewController.viewTapped)(UIGestureRecognizer)]
        
        view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    
    func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        
        InputTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
