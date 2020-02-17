import UIKit

class ViewController: UIViewController {

    lazy var presenter = ViewControllerPresenterBuilder.build(view: self)
    var cellUtilities: ViewControllerTableVIewCellUtilities!
    let sectionHeaderUtilities = ViewControllerTableViewSectionHeaderUtilities()
    let sectionFooterUtilities = ViewControllerTableViewSectionFooterUtilities()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cellUtilities = ViewControllerTableVIewCellUtilities(tableView: self.tableView)
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
            return cellUtilities.decorateCustomerCell(
                indexPath: indexPath,
                value: presenter.itemDataOfCustomer(index: indexPath.row)
            )
        case .item:
            return cellUtilities.decorateItemCell(
                indexPath: indexPath,
                value: presenter.itemDataOfItem(index: indexPath.row)
            )
        case .address:
            return cellUtilities.decorateAddressCell(
                indexPath: indexPath,
                value: presenter.itemDataOfAddress(index: indexPath.row)
            )
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeaderUtilities.header(for: presenter.sectionType(of: section))
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sectionFooterUtilities.footer(for: presenter.sectionType(of: section))
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch presenter.sectionType(of: section) {
        case .customer:
            return sectionHeaderUtilities.height(for: .customer, hasContent: presenter.itemsCountOfCustomer() != 0)
        case .item:
            return sectionHeaderUtilities.height(for: .item, hasContent: presenter.itemsCountOfItem() != 0)
        case .address:
            return sectionHeaderUtilities.height(for: .address, hasContent: presenter.itemsCountOfAddress() != 0)
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch presenter.sectionType(of: section) {
        case .customer:
            return sectionFooterUtilities.height(for: .customer, hasContent: presenter.itemsCountOfCustomer() != 0)
        case .item:
            return sectionFooterUtilities.height(for: .item, hasContent: presenter.itemsCountOfItem() != 0)
        case .address:
            return sectionFooterUtilities.height(for: .address, hasContent: presenter.itemsCountOfAddress() != 0)
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
