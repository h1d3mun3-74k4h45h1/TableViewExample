protocol GetCustomerUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct GetCustomerUseCase {
    let useCaseInput: GetCustomerUseCaseInput
}

extension GetCustomerUseCase: GetUseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
