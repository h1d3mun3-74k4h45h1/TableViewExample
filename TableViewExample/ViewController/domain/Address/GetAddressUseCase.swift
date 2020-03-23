protocol GetAddressUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct GetAddressUseCase {
    let useCaseInput: GetAddressUseCaseInput
}

extension GetAddressUseCase: GetUseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
