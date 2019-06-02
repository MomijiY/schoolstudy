//
//  AddTableViewCell.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
var TodoKobetsunonakami = [String]()

class AddTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ToDoTextField: UITextField!
    
    @IBAction func TodoAddButton(_ sender: Any) {
        TodoKobetsunonakami.append(ToDoTextField.text!)
        ToDoTextField.text = ""
        UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
