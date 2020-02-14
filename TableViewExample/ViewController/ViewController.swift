import UIKit

class ViewController: UIViewController {

    lazy var presenter = ViewControllerPresenterBuilder.build(view: self)
    var cellDecorator: ViewControllerTableViewCellDecorator!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cellDecorator = ViewControllerTableViewCellDecorator(tableView: self.tableView)
    }

}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.sectionType(of: section) {
        case .customer:
            return presenter.itemsCountOfCustomer()
        case .item:
            return presenter.itemsCountOfItem()
        case .address:
            return presenter.itemsCountOfAddress()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.sectionType(of: indexPath.section) {
        case .customer:
            return cellDecorator.decorateCustomerCell(
                indexPath: indexPath,
                value: presenter.itemDataOfCustomer(index: indexPath.row)
            )
        case .item:
            return cellDecorator.decorateItemCell(
                indexPath: indexPath,
                value: presenter.itemDataOfItem(index: indexPath.row)
            )
        case .address:
            return cellDecorator.decorateAddressCell(
                indexPath: indexPath,
                value: presenter.itemDataOfAddress(index: indexPath.row)
            )
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch presenter.sectionType(of: indexPath.section) {
        case .customer:
            presenter.didSelectCustomerRow(of: indexPath.row)
        case .item:
            presenter.didSelectItemRow(of: indexPath.row)
        case .address:
            presenter.didSelectAddressRow(of: indexPath.row)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
