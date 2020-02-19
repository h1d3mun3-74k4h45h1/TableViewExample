protocol ViewControllerCustomerUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ViewControllerCustomerUseCase {
    let useCaseInput: ViewControllerCustomerUseCaseInput
}

extension ViewControllerCustomerUseCase: ViewControllerUseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
