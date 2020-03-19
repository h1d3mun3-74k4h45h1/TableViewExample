import UIKit

final class CustomerCell: UITableViewCell {
    @IBOutlet weak var customerName: UILabel!
}

extension CustomerCell: ConfigurableCell {
    func configure(with cellModel: CellModel) {
        guard let customerCellModel = cellModel as? CustomerCellModel else {
            fatalError("Unsupported CellModel received.")
        }

        customerName.text = customerCellModel.value
    }
}
