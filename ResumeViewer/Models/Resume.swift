//
//  Resume.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import Foundation

class Resume: Codable {
    var name: String?
    var title: String?
    var photoUrl: String?
    var streetAddress: String?
    var city: String?
    var province: String?
    var postalCode: String?
    var phone: String?
    var email: String?
    var highlights: [String]?
    var experience: [WorkExperience]?
    var education: [Education]?
    var references: String?
}

class WorkExperience: Codable {
    var companyName: String?
    var role: String?
    var period: String?
    var description: [String]?
    var logoUrl: String?
}

class Education: Codable {
    var degree: String?
    var major: String?
    var school: String?
    var period: String?
}
