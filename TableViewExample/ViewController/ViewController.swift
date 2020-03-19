import UIKit

class ViewController: UIViewController {
    lazy var presenter = ViewControllerPresenterBuilder.build(view: self)
    let sectionHeaderUtilities = ViewControllerTableViewSectionHeaderUtilities()
    let sectionFooterUtilities = ViewControllerTableViewSectionFooterUtilities()

    @IBOutlet weak var tableView: UITableView!
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellModel = presenter.itemData(of: indexPath) else{
            fatalError("Unknown Sectin received.")
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.sectionType.cellIdentifier(), for: indexPath)

        guard let configurableCell = cell as? ConfigurableCell else {
            return cell
        }

        configurableCell.configure(with: cellModel)

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeaderUtilities.header(for: presenter.sectionHeaderModel(of: section))
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sectionFooterUtilities.footer(for: presenter.sectionFooterModel(of: section))
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderUtilities.height(for: presenter.sectionHeaderModel(of: section))
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionFooterUtilities.height(for: presenter.sectionFooterModel(of: section))
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(of: indexPath)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
