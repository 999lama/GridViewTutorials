//
//  GridViewHeader.swift
//  GridViewTutorial
//
//  Created by Lama Albadri on 14/04/2022.
//

import Foundation
import SwiftGridView

class GridViewHeader: SwiftGridReusableView {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - Reuse Methods
    override open class func reuseIdentifier() -> String {
        return String(describing: GridViewHeader.self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.layer.borderWidth = 1
    }
    
    // MARK: - configure UI
    func configureUI(with title: String?) {
        self.titleLabel.text = title
    }
}

