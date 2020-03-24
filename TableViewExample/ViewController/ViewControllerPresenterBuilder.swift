import UIKit

struct ViewControllerPresenterBuilder {
    static func build(view: ViewController) -> ViewControllerPresenter {
        let customerDataStore = GetCustomerDataStore(customerName: "Test Customer")
        let customerRepository = GetCustomerRepository(repositoryInput: customerDataStore)
        let customerUseCase = GetCustomerUseCase(useCaseInput: customerRepository)

        let itemDataStore = GetItemDataStore(value: "Test Item")
        let itemRepository = GetItemRepository(repositoryInput: itemDataStore)
        let itemUseCase = GetItemUseCase(useCaseInput: itemRepository)

        let addressDataStore = GetAddressDataStore(value: "Test Address")
        let addressRepository = GetAddressRepository(repositoryInput: addressDataStore)
        let addressUseCase = GetAddressUseCase(useCaseInput: addressRepository)

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
