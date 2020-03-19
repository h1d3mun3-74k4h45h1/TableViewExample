import UIKit

struct ViewControllerPresenterBuilder {
    static func build(view: ViewController) -> ViewControllerPresenter {
        let customerDataStore = CustomerDataStore(customerName: "Test Customer")
        let customerRepository = CustomerRepository(repositoryInput: customerDataStore)
        let customerUseCase = CustomerUseCase(useCaseInput: customerRepository)

        let itemDataStore = ItemDataStore(value: "Test Customer")
        let itemRepository = ItemRepository(repositoryInput: itemDataStore)
        let itemUseCase = ItemUseCase(useCaseInput: itemRepository)

        let addressDataStore = AddressDataStore(value: "Test Address")
        let addressRepository = AddressRepository(repositoryInput: addressDataStore)
        let addressUseCase = AddressUseCase(useCaseInput: addressRepository)

        let wireframe = ViewControllerWireframe(view: view)
        let presenter = ViewControllerPresenter(
            view: view,
            wireframe: wireframe,
            customerUseCase: customerUseCase,
            itemUseCase: itemUseCase,
            addressUseCase: addressUseCase)

        return presenter
    }
}
