//
//  AwsomeViewController.swift
//  GridViewTutorials
//
//  Created by Lama Albadri on 15/04/2022.
//

import UIKit
import SwiftGridView

class AwsomeViewController : UIViewController {
    
    @IBOutlet weak var dataGridView: SwiftGridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataGridView.delegate = self
        self.dataGridView.dataSource = self
        self.dataGridView.register(UINib(nibName: String(describing: GridViewHeader.self), bundle: nil), forSupplementaryViewOfKind: SwiftGridElementKindHeader, withReuseIdentifier: GridViewHeader.reuseIdentifier())
        self.dataGridView.register(UINib(nibName: String(describing: GridViewCell.self), bundle: nil), forCellWithReuseIdentifier: GridViewCell.reuseIdentifier())
        
        
    }
    
    
}

// MARK: - SwiftGridViewDataSource Methods
extension AwsomeViewController: SwiftGridViewDataSource {
    
    
    func dataGridView(_ dataGridView: SwiftGridView, cellAtIndexPath indexPath: IndexPath) -> SwiftGridCell {
        let cell =  dataGridView.dequeueReusableCellWithReuseIdentifier(GridViewCell.reuseIdentifier(), forIndexPath: indexPath) as! GridViewCell
        cell.prepareForReuse()
        let gridColors : [UIColor] = [.cyan, .purple, .pink, .orange, .blue]
        cell.titleLabel.text = "[\(indexPath.sgColumn),\(indexPath.sgRow)]" //[1,0]
        cell.backgroundColor = gridColors.randomElement()
        return cell
        
    }
    
    
    func dataGridView(_ dataGridView: SwiftGridView, gridHeaderViewForColumn column: NSInteger) -> SwiftGridReusableView {
        let headerView = dataGridView.dequeueReusableSupplementaryViewOfKind(SwiftGridElementKindHeader, withReuseIdentifier: GridViewHeader.reuseIdentifier(), atColumn: column) as! GridViewHeader
        headerView.prepareForReuse()
        headerView.titleLabel.text = "\(column)"
        return headerView
    }
    
    
}
// MARK: - SwiftGridViewDelegate Methods
extension AwsomeViewController: SwiftGridViewDelegate {
    
    func numberOfSectionsInDataGridView(_ dataGridView: SwiftGridView) -> Int {
        return 1
    }
    
    func numberOfColumnsInDataGridView(_ dataGridView: SwiftGridView) -> Int {
        return 6
    }
    
    func dataGridView(_ dataGridView: SwiftGridView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func heightForGridHeaderInDataGridView(_ dataGridView: SwiftGridView) -> CGFloat {
        return 100
    }
    
    func dataGridView(_ dataGridView: SwiftGridView, widthOfColumnAtIndex columnIndex: Int) -> CGFloat {
        return 200
    }
    func dataGridView(_ dataGridView: SwiftGridView, heightOfRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
