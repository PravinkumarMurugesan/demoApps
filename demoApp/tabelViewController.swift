import UIKit

class tabelViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!

    let viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabelView.delegate = self
        tabelView.dataSource = self

        viewModel.loadUsers() // Load JSON from ViewModel
        tabelView.reloadData() 
    }
}

extension tabelViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell

        let user = viewModel.userAtIndex(indexPath.row)

        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.cellView.layer.cornerRadius = 15
        cell.cellView.layer.masksToBounds = true

        cell.nameLabel.text = user.name
        cell.emailLabel.text = user.email
        cell.mobileLabel.text = user.phone

        return cell
    }
}
