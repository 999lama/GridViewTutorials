//
//  GridViewHeader.swift
//  GridViewTutorial
//
//  Created by Lama Albadri on 14/04/2022.
//

import UIKit
import SwiftGridView

class GridViewCell: SwiftGridCell {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!

  
    
    // MARK: - Reuse Methods
    override open class func reuseIdentifier() -> String {
        return String(describing: GridViewCell.self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray.cgColor
    }
    

}
