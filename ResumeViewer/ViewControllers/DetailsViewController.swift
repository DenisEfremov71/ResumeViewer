//
//  DetailsViewController.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

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
        setupUI()
    }
    
    func setupUI() {
        
        self.title = section.rawValue
        setupScrollView()
        
        switch section {
        case .contactInformation:
            displayContactInformation()
            break
        case .highlights:
            displayHighlights()
            break
        case .workExperience:
            displayWorkExperience()
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
        let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
        
        // scroll view - main container for all other views
        view.addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationBarHeight!).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
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
    
    func displayHighlights() {
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: scrollView.bounds.height)
        let highlightsView = HighlightsView.init(highlights: presenter.resume!.highlights!, frame: rect)
        scrollView.addSubview(highlightsView)
    }
    
    func displayWorkExperience() {
        var yPos = CGFloat(0)
        if let workExpItems = presenter.resume?.experience, workExpItems.count > 0 {
            for workExp in workExpItems {
                let rect = CGRect(x: 0, y: yPos, width: self.view.frame.width, height: 580)
                //let logoURL = workExp.logoUrl! == Constants.EndPoints.freighteraLogoURL ? "freightera" : "fm"
                let workExpView = WorkExperienceView.init(logoURL: workExp.logoUrl!, companyName: workExp.companyName!, role: workExp.role!, period: workExp.period!, description: workExp.description!, frame: rect)
                scrollView.addSubview(workExpView)
                yPos = yPos + 580
            }
        }
    }
    
    func displayEducation() {
        var yPos = CGFloat(0)
        if let educationItems = presenter.resume?.education, educationItems.count > 0 {
            for education in educationItems {
                let rect = CGRect(x: 0, y: yPos, width: scrollView.bounds.width, height: 120)
                let educationView = EducationView.init(degree: education.degree!, major: education.major!, school: education.school!, period: education.period!, frame: rect)
                scrollView.addSubview(educationView)
                yPos = yPos + 120
            }
        }
    }
    
    func displayReferences() {
        let referencesView = ReferencesView.init(references: presenter.resume!.references!, frame: scrollView.bounds)
        scrollView.addSubview(referencesView)
    }
    
}
