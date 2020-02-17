import UIKit

class ViewController: UIViewController {

    lazy var presenter = ViewControllerPresenterBuilder.build(view: self)
    var cellDecorator: ViewControllerTableViewCellDecorator!
    let sectionHeaderDecorator = ViewControllerTableViewSectionHeaderDecorator()
    let sectionFooterDecorator = ViewControllerTableViewSectionFooterDecorator()

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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeaderDecorator.header(for: presenter.sectionType(of: section))
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sectionFooterDecorator.footer(for: presenter.sectionType(of: section))
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch presenter.sectionType(of: section) {
        case .customer:
            return sectionHeaderDecorator.height(for: .customer, hasContent: presenter.itemsCountOfCustomer() != 0)
        case .item:
            return sectionHeaderDecorator.height(for: .item, hasContent: presenter.itemsCountOfItem() != 0)
        case .address:
            return sectionHeaderDecorator.height(for: .address, hasContent: presenter.itemsCountOfAddress() != 0)
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch presenter.sectionType(of: section) {
        case .customer:
            return sectionFooterDecorator.height(for: .customer, hasContent: presenter.itemsCountOfCustomer() != 0)
        case .item:
            return sectionFooterDecorator.height(for: .item, hasContent: presenter.itemsCountOfItem() != 0)
        case .address:
            return sectionFooterDecorator.height(for: .address, hasContent: presenter.itemsCountOfAddress() != 0)
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
