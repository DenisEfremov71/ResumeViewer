import Foundation
import UIKit

extension DetailsViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupUI(width: size.width)
    }
    
    func setupUI(width: CGFloat) {
        
        self.title = section.rawValue
        setupScrollView()
        
        switch section {
        case .contactInformation:
            displayContactInformation()
            break
        case .highlights:
            displayHighlights(width: width)
            break
        case .workExperience:
            displayWorkExperience(width: width)
            break
        case .education:
            displayEducation()
            break
        case .references:
            displayReferences()
            break
        }
    }
    
    func setupScrollView() {
        // scroll view - main container for all other views
        view.addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // remove all the sub views before adding a new one
        let _ = scrollView.subviews.map { $0.removeFromSuperview() }
    }
    
    func displayContactInformation() {
        let contactInformationView = ContactInformation.init(
            title: "Contact Information",
            name: presenter.resume!.name!,
            address: presenter.resume!.streetAddress!,
            city: presenter.resume!.city!,
            phone: presenter.resume!.phone!,
            email: presenter.resume!.email!,
            frame: scrollView.bounds)
        scrollView.addSubview(contactInformationView)
    }
    
    func displayHighlights(width: CGFloat) {
        let rect = CGRect(x: 0, y: 0, width: width, height: scrollView.bounds.height)
        let highlightsView = HighlightsView.init(
            highlights: presenter.resume!.highlights!,
            frame: rect)
        scrollView.addSubview(highlightsView)
    }
    
    func displayWorkExperience(width: CGFloat) {
        var yPos = CGFloat(0)
        if let workExpItems = presenter.resume?.experience, workExpItems.count > 0 {
            for workExp in workExpItems {
                let rect = CGRect(x: 0, y: yPos, width: width, height: Constants.Dimentions.workExpViewHeight)
                let workExpView = WorkExperienceView.init(
                    logoURL: workExp.logoUrl!,
                    companyName: workExp.companyName!,
                    role: workExp.role!,
                    period: workExp.period!,
                    description: workExp.description!,
                    frame: rect)
                scrollView.addSubview(workExpView)
                yPos = yPos + Constants.Dimentions.workExpViewHeight
            }
        }
    }
    
    func displayEducation() {
        var yPos = CGFloat(0)
        if let educationItems = presenter.resume?.education, educationItems.count > 0 {
            for education in educationItems {
                let rect = CGRect(x: 0, y: yPos, width: scrollView.bounds.width, height: Constants.Dimentions.educationViewHeight)
                let educationView = EducationView.init(
                    degree: education.degree!,
                    major: education.major!,
                    school: education.school!,
                    period: education.period!,
                    frame: rect)
                scrollView.addSubview(educationView)
                yPos = yPos + Constants.Dimentions.educationViewHeight
            }
        }
    }
    
    func displayReferences() {
        let referencesView = ReferencesView.init(
            references: presenter.resume!.references!,
            frame: scrollView.bounds)
        scrollView.addSubview(referencesView)
    }
}
