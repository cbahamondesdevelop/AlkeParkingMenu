//
//  BasicTableViewCell.swift
//  Productos
//
//  Created by Training on 31-05-22.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var PlacaLabel: UILabel!
    
    @IBOutlet weak var NombreLabel: UILabel!
    
    
    @IBOutlet weak var ModeloLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
