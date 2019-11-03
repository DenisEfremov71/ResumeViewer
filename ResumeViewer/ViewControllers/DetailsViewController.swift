import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - properties
    
    var presenter = SectionsPresenter()
    var section: Section = .contactInformation
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 1100
        return view
    }()
    
    // MARK: - view controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI(width: self.view.frame.width)
    }
    
}
