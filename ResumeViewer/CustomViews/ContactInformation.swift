//
//  ContactInformation.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-02.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import UIKit

class ContactInformation: UIView {
    
    // MARK: - properties
    
    lazy var lblName: UILabel = {
        let lblName = UILabel(frame: CGRect(x: 20, y: 20, width: 280, height: Constants.Dimentions.lblHeight))
        lblName.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblName.text = "Name"
        lblName.textAlignment = .left
        return lblName
    }()
    
    lazy var lblAddress: UILabel = {
        let lblAddress = UILabel(frame: CGRect(x: 20, y: 40, width: 280, height: Constants.Dimentions.lblHeight))
        lblAddress.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblAddress.text = "Address"
        lblAddress.textAlignment = .left
        return lblAddress
    }()
    
    lazy var lblCity: UILabel = {
        let lblCity = UILabel(frame: CGRect(x: 20, y: 60, width: 280, height: Constants.Dimentions.lblHeight))
        lblCity.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblCity.text = "City"
        lblCity.textAlignment = .left
        return lblCity
    }()
    
    lazy var lblPhone: UILabel = {
        let lblPhone = UILabel(frame: CGRect(x: 20, y: 80, width: 280, height: Constants.Dimentions.lblHeight))
        lblPhone.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblPhone.text = "Phone"
        lblPhone.textAlignment = .left
        return lblPhone
    }()
    
    lazy var lblEmail: UILabel = {
        let lblEmail = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: Constants.Dimentions.lblHeight))
        lblEmail.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblEmail.text = "Email"
        lblEmail.textAlignment = .left
        return lblEmail
    }()
    
    convenience init(title: String, name: String, address: String, city: String, phone: String, email: String, frame: CGRect) {
        self.init(frame: frame)
        lblName.text = name
        lblAddress.text = address
        lblCity.text = city
        lblPhone.text = phone
        lblEmail.text = email
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
        self.addSubview(lblName)
        self.addSubview(lblAddress)
        self.addSubview(lblCity)
        self.addSubview(lblPhone)
        self.addSubview(lblEmail)
        //self.setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            // pin lblName to lblTitle
            lblName.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            lblName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lblName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lblName.heightAnchor.constraint(equalToConstant: Constants.Dimentions.lblHeight),
            
            // pin lblAddress to lblName
            lblAddress.topAnchor.constraint(equalTo: lblName.topAnchor, constant: 0),
            lblAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lblAddress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lblAddress.heightAnchor.constraint(equalToConstant: Constants.Dimentions.lblHeight),
            
            // pin lblCity to lblAddress
            lblCity.topAnchor.constraint(equalTo: lblAddress.topAnchor, constant: 0),
            lblCity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lblCity.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lblCity.heightAnchor.constraint(equalToConstant: Constants.Dimentions.lblHeight),
            
            // pin lblPhone to lblCity
            lblPhone.topAnchor.constraint(equalTo: lblCity.topAnchor, constant: 0),
            lblPhone.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lblPhone.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lblPhone.heightAnchor.constraint(equalToConstant: Constants.Dimentions.lblHeight),
            
            // pin lblEmail to lblPhone
            lblEmail.topAnchor.constraint(equalTo: lblPhone.topAnchor, constant: 0),
            lblEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lblEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lblEmail.heightAnchor.constraint(equalToConstant: Constants.Dimentions.lblHeight),
        ])
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
