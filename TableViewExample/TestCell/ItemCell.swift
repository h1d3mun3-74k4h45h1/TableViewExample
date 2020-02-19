import UIKit

final class ItemCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
}

extension ItemCell: ViewControllerConfigurableCell {
    func configure(with cellModel: ViewControllerCellModel) {
        guard let itemCellModel = cellModel as? ViewControllerItemCellModel else {
            fatalError("Unsupported CellModel received.")
        }

        itemName.text = itemCellModel.value
    }
}
