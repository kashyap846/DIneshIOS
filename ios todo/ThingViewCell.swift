//
//  ThingViewCell.swift
//  ios todo
//
//  Created by Likhith P.s. on 2019-12-09.
//  Copyright © 2019 dinesh. All rights reserved.
//

import UIKit

class ThingViewCell: UITableViewCell {

    @IBOutlet weak var thingsTitleLabel: UILabel!
    
    
    @IBOutlet weak var doneByTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
