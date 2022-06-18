//
//  ViewController.swift
//  GridViewPart2Finished
//
//  Created by Lama Albadri on 18/06/2022.
//

import UIKit
import SwiftGridView


class StudentsGridView: UIViewController {
    
    @IBOutlet weak var gridView: SwiftGridView!
    
    
    var students : [StudentsViewData]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students Grades"
        self.populataViewData()
        self.gridView.delegate = self
        self.gridView.dataSource = self
        self.gridView.register(UINib(nibName: String(describing: GridViewHeader.self), bundle: nil), forSupplementaryViewOfKind: SwiftGridElementKindHeader, withReuseIdentifier: GridViewHeader.reuseIdentifier())
        self.gridView.register(UINib(nibName: String(describing: GridViewCell.self), bundle: nil), forCellWithReuseIdentifier: GridViewCell.reuseIdentifier())
        
       
    }

    private func populataViewData() {
        students = [StudentsViewData.init(studentName: "Lama", studentGrades: [Grade(subject: "Math", grade: 5.6), Grade(subject: "Sciences", grade: 10), Grade(subject: "Physics", grade: 9.9), Grade(subject: "Biology", grade: 9.9)])]
        students?.append(StudentsViewData.init(studentName: "Renad", studentGrades: [Grade(subject: "Math", grade: 7), Grade(subject: "Sciences", grade: 6), Grade(subject: "Physics", grade: 10), Grade(subject: "Biology", grade: 9.9)]))
        students?.append(StudentsViewData.init(studentName: "Arwa", studentGrades: [Grade(subject: "Math", grade: 3), Grade(subject: "Sciences", grade: 10), Grade(subject: "Physics", grade: 9.5), Grade(subject: "Biology", grade: 9.9)]))
        students?.append(StudentsViewData.init(studentName: "Norah", studentGrades: [Grade(subject: "Math", grade: 6.7), Grade(subject: "Sciences", grade: 9.4), Grade(subject: "Physics", grade: 9.8), Grade(subject: "Biology", grade: 10)]))
        students?.append(StudentsViewData.init(studentName: "Najla", studentGrades: [Grade(subject: "Math", grade: 8.7), Grade(subject: "Sciences", grade: 9.9), Grade(subject: "Physics", grade: 9.9), Grade(subject: "Biology", grade: 10)]))
        students?.append(StudentsViewData.init(studentName: "Nada", studentGrades: [Grade(subject: "Math", grade: 9.7), Grade(subject: "Sciences", grade: 10), Grade(subject: "Physics", grade:  10), Grade(subject: "Biology", grade: 10)]))
    }

}


// MARK: - SwiftGridViewDataSource Methods
extension StudentsGridView: SwiftGridViewDataSource {
    
    
    func dataGridView(_ dataGridView: SwiftGridView, cellAtIndexPath indexPath: IndexPath) -> SwiftGridCell {
        let cell =  dataGridView.dequeueReusableCellWithReuseIdentifier(GridViewCell.reuseIdentifier(), forIndexPath: indexPath) as! GridViewCell
        cell.prepareForReuse()
//        cell.titleLabel.text = "[\(indexPath.sgColumn),\(indexPath.sgRow)]" //[1,0]
        if let grade = students?[indexPath.sgColumn].studentGrades?[indexPath.sgRow].grade {
            cell.titleLabel.text = "\(grade) out of 10 "
        }
        return cell
        
    }
    
    
    func dataGridView(_ dataGridView: SwiftGridView, gridHeaderViewForColumn column: NSInteger) -> SwiftGridReusableView {
        let headerView = dataGridView.dequeueReusableSupplementaryViewOfKind(SwiftGridElementKindHeader, withReuseIdentifier: GridViewHeader.reuseIdentifier(), atColumn: column) as! GridViewHeader
        headerView.prepareForReuse()
        headerView.titleLabel.text = students?[column].studentName
     
        return headerView
    }
    
    
}
// MARK: - SwiftGridViewDelegate Methods
extension StudentsGridView: SwiftGridViewDelegate {
    
    func numberOfSectionsInDataGridView(_ dataGridView: SwiftGridView) -> Int {
        return 1
    }
    
    func numberOfColumnsInDataGridView(_ dataGridView: SwiftGridView) -> Int {
//        return 6
        return self.students?.count ?? 0
    }
    
    func dataGridView(_ dataGridView: SwiftGridView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return self.students?[section].studentGrades?.count ?? 0
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
