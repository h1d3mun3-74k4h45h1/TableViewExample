protocol ItemUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ItemUseCase {
    let useCaseInput: ItemUseCaseInput
}

extension ItemUseCase: UseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
