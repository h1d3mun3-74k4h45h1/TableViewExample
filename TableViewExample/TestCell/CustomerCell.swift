import UIKit

final class CustomerCell: UITableViewCell {
    @IBOutlet weak var customerName: UILabel!
}

extension CustomerCell: ViewControllerConfigurableCell {
    func configure(with cellModel: ViewControllerCellModel) {
        guard let customerCellModel = cellModel as? ViewControllerCustomerCellModel else {
            fatalError("Unsupported CellModel received.")
        }

        customerName.text = customerCellModel.value
    }
}
