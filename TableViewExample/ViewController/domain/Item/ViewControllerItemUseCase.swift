protocol ViewControllerItemUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ViewControllerItemUseCase {
    let useCaseInput: ViewControllerItemUseCaseInput
}

extension ViewControllerItemUseCase: ViewControllerUseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
