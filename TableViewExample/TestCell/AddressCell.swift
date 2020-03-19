import UIKit

final class AddressCell: UITableViewCell {
    @IBOutlet weak var addressName: UILabel!
}

extension AddressCell: ConfigurableCell {
    func configure(with cellModel: CellModel) {
        guard let addressCellModel = cellModel as? AddressCellModel else {
            fatalError("Unsupported CellModel received.")
        }

        addressName.text = addressCellModel.value
    }
}
