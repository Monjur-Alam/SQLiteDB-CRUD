//
//  PreviousContactListTableViewCell.swift
//  SQLiteDB CRUD
//
//  Created by MacBook Pro on 9/6/22.
//

import UIKit

class PreviousContactListTableViewCell: UITableViewCell {

    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var phone : UILabel!
    @IBOutlet weak var avatar : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
