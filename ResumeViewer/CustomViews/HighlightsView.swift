import UIKit

class HighlightsView: UIView {

    lazy var txtHighlights: UITextView = {
        let txtHighlights = UITextView(frame: CGRect(x: 20, y: 20, width: self.frame.width - 40, height: Constants.Dimentions.txtViewHeightTaller))
        txtHighlights.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        txtHighlights.text = ""
        txtHighlights.textAlignment = .left
        txtHighlights.isEditable = false
        return txtHighlights
    }()
    
    convenience init(highlights: [String], frame: CGRect) {
        self.init(frame: frame)
        for hl in highlights {
            txtHighlights.text = txtHighlights.text + "\u{2022} " + hl + "\n\n"
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
        self.addSubview(txtHighlights)
    }

}
