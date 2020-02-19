protocol ViewControllerAddressUseCaseInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ViewControllerAddressUseCase {
    let useCaseInput: ViewControllerAddressUseCaseInput
}

extension ViewControllerAddressUseCase: ViewControllerUseCaseProtocol {
    func itemCount() -> Int {
        return useCaseInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return useCaseInput.itemData(of: index)
    }
}
