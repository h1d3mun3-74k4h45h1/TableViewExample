import UIKit

protocol ViewControllerPresenterProtocol {
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func itemData(of indexPath: IndexPath) -> CellModel?
    func sectionHeaderModel(of section: Int) -> SectionHeaderModel
    func sectionFooterModel(of section: Int) -> SectionFooterModel
    func didSelectRow(of indexPath: IndexPath)
}

final class ViewControllerPresenter {
    weak var view: UIViewController?
    let wireframe: ViewControllerWireframeProtocol
    let customerUseCase: GetUseCaseProtocol
    let itemUseCase: GetUseCaseProtocol
    let addressUseCase: GetUseCaseProtocol

    init(view: UIViewController, wireframe: ViewControllerWireframeProtocol, customerUseCase: GetUseCaseProtocol, itemUseCase: GetUseCaseProtocol, addressUseCase: GetUseCaseProtocol) {
        self.view = view
        self.wireframe = wireframe
        self.customerUseCase = customerUseCase
        self.itemUseCase = itemUseCase
        self.addressUseCase = addressUseCase
    }
}

extension ViewControllerPresenter: ViewControllerPresenterProtocol {
    func numberOfSections() -> Int {
        return 3
    }

    func numberOfRows(in section: Int) -> Int {
        guard let sectionType = TableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            return customerUseCase.execute().count
        case .item:
            return itemUseCase.execute().count
        case .address:
            return addressUseCase.execute().count
        }
    }

    func itemData(of indexPath: IndexPath) -> CellModel? {
        guard let sectionType = TableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            return CustomerCellModel(value: customerUseCase.execute()[indexPath.row])
        case .item:
            return ItemCellModel(value: itemUseCase.execute()[indexPath.row] )
        case .address:
            return AddressCellModel(value: addressUseCase.execute()[indexPath.row])
        }
    }

    func sectionHeaderModel(of section: Int) -> SectionHeaderModel {
        guard let sectionType = TableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return CustomerSectionHeaderModel(isHidden: customerUseCase.execute().count == 0)
         case .item:
            return ItemSectionHeaderModel(isHidden: itemUseCase.execute().count == 0)
         case .address:
            return AddressSectionHeaderModel(isHidden: addressUseCase.execute().count == 0)
         }
    }

    func sectionFooterModel(of section: Int) -> SectionFooterModel {
        guard let sectionType = TableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return CustomerSectionFooterModel(isHidden: customerUseCase.execute().count == 0)
         case .item:
            return ItemSectionFooterModel(isHidden: itemUseCase.execute().count == 0)
         case .address:
            return AddressSectionFooterModel(isHidden: addressUseCase.execute().count == 0)
         }
    }

    func didSelectRow(of indexPath: IndexPath) {
        guard let sectionType = TableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            wireframe.showCustomerDetail(name: customerUseCase.execute()[indexPath.row])
        case .item:
            wireframe.showItemDetail(itemName: itemUseCase.execute()[indexPath.row])
        case .address:
            wireframe.showAddressDetail(address: addressUseCase.execute()[indexPath.row])
        }
    }
}
