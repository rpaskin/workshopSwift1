//
//  ItemCustomTableViewCell.swift
//  AppLista
//
//  Created by ORT1 on 4/17/16.
//  Copyright © 2016 ORT. All rights reserved.
//

import UIKit

class ItemCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
