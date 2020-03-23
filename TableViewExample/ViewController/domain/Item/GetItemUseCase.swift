protocol GetItemUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct GetItemUseCase {
    let useCaseInput: GetItemUseCaseInput
}

extension GetItemUseCase: GetUseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
