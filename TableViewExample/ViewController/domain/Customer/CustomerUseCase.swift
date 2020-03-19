protocol CustomerUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct CustomerUseCase {
    let useCaseInput: CustomerUseCaseInput
}

extension CustomerUseCase: UseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
