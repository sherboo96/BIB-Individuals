//
//  ServicesCell.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

class ServicesCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

    func setupCell() {
        
    }
}

extension ServicesCell: HomeCellViewProtocol {
    func setTitle(name: String) {
        self.lblTitle.text = name
    }
    
}
