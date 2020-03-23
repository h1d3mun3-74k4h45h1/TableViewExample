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
            return customerUseCase.itemCount()
        case .item:
            return itemUseCase.itemCount()
        case .address:
            return addressUseCase.itemCount()
        }
    }

    func itemData(of indexPath: IndexPath) -> CellModel? {
        guard let sectionType = TableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            guard let data = customerUseCase.itemData(of: indexPath.row) else { return nil }
            return CustomerCellModel(value: data)
        case .item:
            guard let data = itemUseCase.itemData(of: indexPath.row) else { return nil }
            return ItemCellModel(value: data)
        case .address:
            guard let data = addressUseCase.itemData(of: indexPath.row) else { return nil }
            return AddressCellModel(value: data)
        }
    }

    func sectionHeaderModel(of section: Int) -> SectionHeaderModel {
        guard let sectionType = TableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return CustomerSectionHeaderModel(isHidden: customerUseCase.itemCount() == 0)
         case .item:
            return ItemSectionHeaderModel(isHidden: itemUseCase.itemCount() == 0)
         case .address:
            return AddressSectionHeaderModel(isHidden: addressUseCase.itemCount() == 0)
         }
    }

    func sectionFooterModel(of section: Int) -> SectionFooterModel {
        guard let sectionType = TableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return CustomerSectionFooterModel(isHidden: customerUseCase.itemCount() == 0)
         case .item:
            return ItemSectionFooterModel(isHidden: itemUseCase.itemCount() == 0)
         case .address:
            return AddressSectionFooterModel(isHidden: addressUseCase.itemCount() == 0)
         }
    }

    func didSelectRow(of indexPath: IndexPath) {
        guard let sectionType = TableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            guard let value = customerUseCase.itemData(of: indexPath.section) else { return }
            wireframe.showCustomerDetail(name: value)
        case .item:
            guard let value = itemUseCase.itemData(of: indexPath.section) else { return }
            wireframe.showItemDetail(itemName: value)
        case .address:
            guard let value = addressUseCase.itemData(of: indexPath.section) else { return }
            wireframe.showAddressDetail(address: value)
        }
    }
}
