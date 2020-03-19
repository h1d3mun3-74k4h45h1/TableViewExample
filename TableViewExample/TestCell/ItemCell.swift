import UIKit

final class ItemCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
}

extension ItemCell: ConfigurableCell {
    func configure(with cellModel: CellModel) {
        guard let itemCellModel = cellModel as? ItemCellModel else {
            fatalError("Unsupported CellModel received.")
        }

        itemName.text = itemCellModel.value
    }
}
