protocol AddressUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct AddressUseCase {
    let useCaseInput: AddressUseCaseInput
}

extension AddressUseCase: UseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
