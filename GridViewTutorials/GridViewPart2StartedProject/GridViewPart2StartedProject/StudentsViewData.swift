//
//  StudentsViewData.swift
//  GridViewPart2StartedProject
//
//  Created by Lama Albadri on 18/06/2022.
//

import Foundation

struct StudentsViewData {
    
    var studentName: String?
    var studentGrades: [Grade]?
    
    init(studentName: String, studentGrades: [Grade] ) {
        self.studentName = studentName
        self.studentGrades = studentGrades
    }
}

struct Grade {
    var subject: String? 
    var grade: Double?
    
}
