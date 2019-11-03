import UIKit

class EducationView: UIView {

    // MARK: - properties
    
    lazy var lblDegree: UILabel = {
        let lblDegree = UILabel(frame: CGRect(x: 24, y: 20, width: 280, height: Constants.Dimentions.lblHeight))
        lblDegree.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lblDegree.text = "Degree"
        lblDegree.textAlignment = .left
        return lblDegree
    }()
    
    lazy var lblMajor: UILabel = {
        let lblMajor = UILabel(frame: CGRect(x: 24, y: 40, width: 280, height: Constants.Dimentions.lblHeight))
        lblMajor.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblMajor.text = "Major"
        lblMajor.textAlignment = .left
        return lblMajor
    }()
    
    lazy var lblSchool: UILabel = {
        let lblSchool = UILabel(frame: CGRect(x: 24, y: 60, width: 280, height: Constants.Dimentions.lblHeight))
        lblSchool.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblSchool.text = "School"
        lblSchool.textAlignment = .left
        return lblSchool
    }()
    
    lazy var lblPeriod: UILabel = {
        let lblPeriod = UILabel(frame: CGRect(x: 24, y: 80, width: 280, height: Constants.Dimentions.lblHeight))
        lblPeriod.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lblPeriod.text = "Period"
        lblPeriod.textAlignment = .left
        return lblPeriod
    }()
    
    convenience init(degree: String, major: String, school: String, period: String, frame: CGRect) {
        self.init(frame: frame)
        lblDegree.text = degree
        lblMajor.text = major
        lblSchool.text = school
        lblPeriod.text = period
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
        self.addSubview(lblDegree)
        self.addSubview(lblMajor)
        self.addSubview(lblSchool)
        self.addSubview(lblPeriod)
    }

}
