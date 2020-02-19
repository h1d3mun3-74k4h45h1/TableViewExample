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
    let useCase: ViewControllerUseCaseProtocol

    init(view: UIViewController, wireframe: ViewControllerWireframeProtocol, useCase: ViewControllerUseCaseProtocol) {
        self.view = view
        self.wireframe = wireframe
        self.useCase = useCase
    }
}

extension ViewControllerPresenter: ViewControllerPresenterProtocol {
    func numberOfSections() -> Int {
        return useCase.numberOfSections()
    }

    func numberOfRows(in section: Int) -> Int {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            return useCase.itemsOfCustomer().count
        case .item:
            return useCase.itemsOfItem().count
        case .address:
            return useCase.itemsOfAddress().count
        }
    }

    func itemData(of indexPath: IndexPath) -> ViewControllerCellModel? {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            guard let data = useCase.itemOfItem(index: indexPath.row) else { return nil }
            return ViewControllerCustomerCellModel(value: data)
        case .item:
            guard let data = useCase.itemOfItem(index: indexPath.row) else { return nil }
            return ViewControllerItemCellModel(value: data)
        case .address:
            guard let data = useCase.itemOfAddress(index: indexPath.row) else { return nil }
            return ViewControllerAddressCellModel(value: data)
        }
    }

    func sectionHeaderModel(of section: Int) -> ViewControllerSectionHeaderModel {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return ViewControllerCustomerSectionHeaderModel(isHidden: useCase.itemsOfCustomer().count == 0)
         case .item:
            return ViewControllerItemSectionHeaderModel(isHidden: useCase.itemsOfItem().count == 0)
         case .address:
            return ViewControllerAddressSectionHeaderModel(isHidden: useCase.itemsOfAddress().count == 0)
         }
    }

    func sectionFooterModel(of section: Int) -> ViewControllerSectionFooterModel {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
         case .customer:
            return ViewControllerCustomerSectionFooterModel(isHidden: useCase.itemsOfCustomer().count == 0)
         case .item:
            return ViewControllerItemSectionFooterModel(isHidden: useCase.itemsOfItem().count == 0)
         case .address:
            return ViewControllerAddressSectionFooterModel(isHidden: useCase.itemsOfAddress().count == 0)
         }
    }

    func didSelectRow(of indexPath: IndexPath) {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: indexPath.section) else {
            fatalError("Unknown Section received.")
        }

        switch sectionType {
        case .customer:
            guard let value = useCase.itemOfCustomer(index: indexPath.section) else { return }
            wireframe.showCustomerDetail(name: value)
        case .item:
            guard let value = useCase.itemOfItem(index: indexPath.section) else { return }
            wireframe.showItemDetail(itemName: value)
        case .address:
            guard let value = useCase.itemOfAddress(index: indexPath.section) else { return }
            wireframe.showAddressDetail(address: value)
        }
    }
}
