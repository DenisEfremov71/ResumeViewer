import UIKit

class SectionsViewController: UITableViewController {
    
    // MARK: - Properties
    
    let presenter = SectionsPresenter()
    var selectedSection: Section = .contactInformation
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    let sections: [String] = ["Overview", "Categories"]
    let items: [[String]] = [
        ["Contact Information", "Highlights"],          // Overview items
        ["Work Experience", "Education", "References"]  // Category items
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        UiHelper.addActivityIndicator(view: self.view, activityIndicator: activityIndicator)
        presenter.getResume { (success, error) in
            UiHelper.removeActivityIndicator(activityIndicator: self.activityIndicator)
            guard error == nil else {
                UiHelper.showAlert(for: self, with: "\(Constants.ErrorMessages.couldNotGetResume) Description: \(error!.localizedDescription)")
                return
            }
            guard success == true else {
                UiHelper.showAlert(for: self, with: "\(Constants.ErrorMessages.noResumeReturned)")
                return
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resumeCell", for: indexPath)

        cell.textLabel?.text = items[indexPath.section][indexPath.row]

        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = presenter.resume else {
            UiHelper.showAlert(for: self, with: Constants.ErrorMessages.couldNotGetResume)
            return
        }
        selectedSection = Section(rawValue: items[indexPath.section][indexPath.row])!
        performSegue(withIdentifier: "showDetails", sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsViewController
        vc.presenter = self.presenter
        vc.section = selectedSection
    }

}
