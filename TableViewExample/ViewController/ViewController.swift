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
        return presenter.numberOfItems(in: section)
//        switch presenter.sectionType(of: section) {
//        case .customer:
//            return presenter.itemsCountOfCustomer()
//        case .item:
//            return presenter.itemsCountOfItem()
//        case .address:
//            return presenter.itemsCountOfAddress()
//        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        protocol CellModelProtocol {
            var cellType: ViewControllerCellType
        }



        class CustomerCellModel: CellModelProtocol {
            let value: CustomerDataModel
        }

        protocol ViewControllerConfigurablewCell {
            func configure(from model: CellModel)
        }

        guard let cellModel = presenter.itemData(of: indexPAth) else { fatalError() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellType.identifier, for: indexPath) as? ViewControllerConfigurablewCell else {
            return UITableViewCell()
        }

        cell.configure(from: cellModel)
        return cell
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
        presenter.didSelectRow(at: indexPath)
//        switch presenter.sectionType(of: indexPath.section) {
//        case .customer:
//            presenter.didSelectCustomerRow(of: indexPath.row)
//        case .item:
//            presenter.didSelectItemRow(of: indexPath.row)
//        case .address:
//            presenter.didSelectAddressRow(of: indexPath.row)
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
