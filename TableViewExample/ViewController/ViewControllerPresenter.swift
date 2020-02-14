import UIKit

protocol ViewControllerPresenterProtocol {
    func sectionType(of section: Int) -> ViewControllerTableViewSectionType
    func numberOfSections() -> Int
    func itemsCountOfCustomer() -> Int
    func itemsCountOfItem() -> Int
    func itemsCountOfAddress() -> Int
    func itemDataOfCustomer(index: Int) -> String
    func itemDataOfItem(index: Int) -> String
    func itemDataOfAddress(index: Int) -> String
    func didSelectCustomerRow(of index: Int)
    func didSelectItemRow(of index: Int)
    func didSelectAddressRow(of index: Int)
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
    func sectionType(of section: Int) -> ViewControllerTableViewSectionType {
        guard let sectionType = ViewControllerTableViewSectionType(rawValue: section) else { fatalError() }
        return sectionType
    }

    func numberOfSections() -> Int {
        return useCase.numberOfSections()
    }

    func itemsCountOfCustomer() -> Int {
        return useCase.itemsOfCustomer().count
    }

    func itemsCountOfItem() -> Int {
        return useCase.itemsOfItem().count
    }

    func itemsCountOfAddress() -> Int {
        return useCase.itemsOfAddress().count
    }

    func itemDataOfCustomer(index: Int) -> String {
        return useCase.itemOfCustomer(index: index)
    }

    func itemDataOfItem(index: Int) -> String {
        return useCase.itemOfItem(index: index)
    }

    func itemDataOfAddress(index: Int) -> String {
        return useCase.itemOfAddress(index: index)
    }

    func didSelectCustomerRow(of index: Int) {
        let value = useCase.itemOfCustomer(index: index)
        wireframe.showCustomerDetail(name: value)
    }

    func didSelectItemRow(of index: Int) {
        let value = useCase.itemOfItem(index: index)
        wireframe.showItemDetail(itemName: value)
    }

    func didSelectAddressRow(of index: Int) {
        let value = useCase.itemOfAddress(index: index)
        wireframe.showAddressDetail(address: value)
    }
}
