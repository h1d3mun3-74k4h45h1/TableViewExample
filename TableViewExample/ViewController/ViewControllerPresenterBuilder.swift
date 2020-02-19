import UIKit

struct ViewControllerPresenterBuilder {
    static func build(view: ViewController) -> ViewControllerPresenter {
        
        let customerDataStore = ViewControllerCustomerDataStore(customerName: "Test Customer")
        let customerRepository = ViewControllerCustomerRepository(repositoryInput: customerDataStore)
        let customerUseCase = ViewControllerCustomerUseCase(useCaseInput: customerRepository)

        let itemDataStore = ViewControllerItemDataStore(value: "Test Customer")
        let itemRepository = ViewControllerItemRepository(repositoryInput: itemDataStore)
        let itemUseCase = ViewControllerItemUseCase(useCaseInput: itemRepository)

        let addressDataStore = ViewControllerAddressDataStore(value: "Test Address")
        let addressRepository = ViewControllerAddressRepository(repositoryInput: addressDataStore)
        let addressUseCase = ViewControllerAddressUseCase(useCaseInput: addressRepository)

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
