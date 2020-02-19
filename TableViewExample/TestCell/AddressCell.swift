import UIKit

final class AddressCell: UITableViewCell {
    @IBOutlet weak var addressName: UILabel!
}

extension AddressCell: ViewControllerConfigurableCell {
    func configure(with cellModel: ViewControllerCellModel) {
        guard let addressCellModel = cellModel as? ViewControllerAddressCellModel else {
            fatalError("Unsupported CellModel received.")
        }

        addressName.text = addressCellModel.value
    }
}
