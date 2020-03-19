import UIKit

protocol ViewControllerPresenterProtocol {
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func itemData(of indexPath: IndexPath) -> ViewControllerCellModel?
    func sectionHeaderModel(of section: Int) -> ViewControllerSectionHeaderModel
    func sectionFooterModel(of section: Int) -> ViewControllerSectionFooterModel
    func didSelectRow(of indexPath: IndexPath)
}

final class ViewControllerPresenter {
    weak var view: UIViewController?
    let wireframe: ViewControllerWireframeProtocol
    let customerUseCase: UseCaseProtocol
    let itemUseCase: UseCaseProtocol
    let addressUseCase: UseCaseProtocol

    init(view: UIViewController, wireframe: ViewControllerWireframeProtocol, customerUseCase: UseCaseProtocol, itemUseCase: UseCaseProtocol, addressUseCase: UseCaseProtocol) {
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
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else {
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

    func itemData(of indexPath: IndexPath) -> ViewControllerCellModel? {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            guard let data = customerUseCase.itemData(of: indexPath.row) else { return nil }
            return ViewControllerCustomerCellModel(value: data)
        case .item:
            guard let data = itemUseCase.itemData(of: indexPath.row) else { return nil }
            return ViewControllerItemCellModel(value: data)
        case .address:
            guard let data = addressUseCase.itemData(of: indexPath.row) else { return nil }
            return ViewControllerAddressCellModel(value: data)
        }
    }

    func sectionHeaderModel(of section: Int) -> ViewControllerSectionHeaderModel {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return ViewControllerCustomerSectionHeaderModel(isHidden: customerUseCase.itemCount() == 0)
         case .item:
            return ViewControllerItemSectionHeaderModel(isHidden: itemUseCase.itemCount() == 0)
         case .address:
            return ViewControllerAddressSectionHeaderModel(isHidden: addressUseCase.itemCount() == 0)
         }
    }

    func sectionFooterModel(of section: Int) -> ViewControllerSectionFooterModel {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return ViewControllerCustomerSectionFooterModel(isHidden: customerUseCase.itemCount() == 0)
         case .item:
            return ViewControllerItemSectionFooterModel(isHidden: itemUseCase.itemCount() == 0)
         case .address:
            return ViewControllerAddressSectionFooterModel(isHidden: addressUseCase.itemCount() == 0)
         }
    }

    func didSelectRow(of indexPath: IndexPath) {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: indexPath.section) else {
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
