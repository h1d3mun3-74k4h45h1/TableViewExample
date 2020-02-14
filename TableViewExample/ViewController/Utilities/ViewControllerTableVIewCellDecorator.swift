import UIKit

protocol ViewControllerTableViewCellDecoratorProtocol {
    func decorateCustomerCell(indexPath: IndexPath, value: String) -> CustomerCell
    func decorateItemCell(indexPath: IndexPath, value: String) -> ItemCell
    func decorateAddressCell(indexPath: IndexPath, value: String) -> AddressCell
}

struct ViewControllerTableViewCellDecorator {
    let tableView: UITableView
}

extension ViewControllerTableViewCellDecorator: ViewControllerTableViewCellDecoratorProtocol {
    func decorateCustomerCell(indexPath: IndexPath, value: String) -> CustomerCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath) as? CustomerCell else {
            fatalError()
        }
        cell.customerName.text = value

        return cell
    }

    func decorateItemCell(indexPath: IndexPath, value: String) -> ItemCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
            fatalError()
        }
        cell.itemName.text = value

        return cell
    }

    func decorateAddressCell(indexPath: IndexPath, value: String) -> AddressCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as? AddressCell else {
            fatalError()
        }
        cell.addressName.text = value

        return cell
    }
}
