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
    }
}
