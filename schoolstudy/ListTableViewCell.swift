//
//  ListTableViewCell.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var todolabel: UILabel!
    @IBOutlet var sublabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
