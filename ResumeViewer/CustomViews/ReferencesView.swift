import UIKit

class ReferencesView: UIView {

    lazy var txtReferences: UITextView = {
        let txtReferences = UITextView(frame: CGRect(x: 20, y: 20, width: 280, height: Constants.Dimentions.txtViewHeight))
        txtReferences.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        txtReferences.text = ""
        txtReferences.textAlignment = .left
        txtReferences.isEditable = false
        return txtReferences
    }()
    
    convenience init(references: String, frame: CGRect) {
        self.init(frame: frame)
        txtReferences.text = "\u{2022} " + references
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
        self.addSubview(txtReferences)
    }

}
