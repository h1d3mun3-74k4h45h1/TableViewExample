import UIKit

final class CustomerCell: UITableViewCell {
    @IBOutlet weak var customerName: UILabel!

    func configure(from cellModel: CustomerCellModel) {
        customerName.text = cellModel.customerName
    }
}

extension CustomerCell: ViewControllerConfigurablewCell{
    func configure(from model: CellModel) {
        guard let value = model as? CustoerCellModel else { fatalError() }
        waiwai
    }
}
