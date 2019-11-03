//
//  WorkExperience.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-02.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import UIKit

class WorkExperienceView: UIView {
    
    // MARK: - properties
    
    lazy var companyLogo: UIImageView = {
        let companyLogo = UIImageView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        companyLogo.contentMode = UIView.ContentMode.scaleAspectFill
        return companyLogo
    }()
    
    lazy var lblCompanyName: UILabel = {
        let lblCompanyName = UILabel(frame: CGRect(x: 24, y: 140, width: 280, height: Constants.Dimentions.lblHeight))
        lblCompanyName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lblCompanyName.text = "Company Name"
        lblCompanyName.textAlignment = .left
        return lblCompanyName
    }()
    
    lazy var lblRole: UILabel = {
        let lblRole = UILabel(frame: CGRect(x: 24, y: 160, width: 280, height: Constants.Dimentions.lblHeight))
        lblRole.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lblRole.text = "Role"
        lblRole.textAlignment = .left
        return lblRole
    }()
    
    lazy var lblPeriod: UILabel = {
        let lblPeriod = UILabel(frame: CGRect(x: 24, y: 180, width: 280, height: Constants.Dimentions.lblHeight))
        lblPeriod.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lblPeriod.text = "Period"
        lblPeriod.textAlignment = .left
        return lblPeriod
    }()
    
    lazy var txtDescription: UITextView = {
        let txtDescription = UITextView(frame: CGRect(x: 20, y: 220, width: self.frame.width - 40, height: Constants.Dimentions.txtViewHeight))
        txtDescription.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        txtDescription.text = ""
        txtDescription.textAlignment = .left
        txtDescription.isEditable = false
        return txtDescription
    }()
    
    convenience init(logoURL: String, companyName: String, role: String, period: String, description: [String], frame: CGRect) {
        self.init(frame: frame)
        let url = URL(string: logoURL)
        companyLogo.load(url: url!)
        lblCompanyName.text = companyName
        lblRole.text = role
        lblPeriod.text = period
        for desc in description {
            txtDescription.text = txtDescription.text + "\u{2022} " + desc + "\n\n"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    func commonInitialization() {
        self.addSubview(companyLogo)
        self.addSubview(lblCompanyName)
        self.addSubview(lblRole)
        self.addSubview(lblPeriod)
        self.addSubview(txtDescription)
    }
    
}
