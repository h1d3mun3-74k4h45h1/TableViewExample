protocol ViewControllerUseCaseProtocol {
    func numberOfSections() -> Int
    func itemsOfCustomer() -> [String]
    func itemsOfItem() -> [String]
    func itemsOfAddress() -> [String]
    func itemOfCustomer(index: Int) -> String?
    func itemOfItem(index: Int) -> String?
    func itemOfAddress(index: Int) -> String?
}

protocol ViewControllerUseCaseInput {
    func numberOfSections() -> Int
    func itemsOfCustomer() -> [String]
    func itemsOfItem() -> [String]
    func itemsOfAddress() -> [String]
    func itemOfCustomer(index: Int) -> String?
    func itemOfItem(index: Int) -> String?
    func itemOfAddress(index: Int) -> String?
}

struct ViewControllerUseCase {
    let useCaseInput: ViewControllerUseCaseInput
}

extension ViewControllerUseCase: ViewControllerUseCaseProtocol {
    func numberOfSections() -> Int {
        return useCaseInput.numberOfSections()
    }

    func itemsOfCustomer() -> [String] {
        return useCaseInput.itemsOfCustomer()
    }

    func itemsOfItem() -> [String] {
        return useCaseInput.itemsOfItem()
    }

    func itemsOfAddress() -> [String] {
        return useCaseInput.itemsOfAddress()
    }
    
    func itemOfCustomer(index: Int) -> String? {
        return useCaseInput.itemOfCustomer(index: index)
    }

    func itemOfItem(index: Int) -> String? {
        return useCaseInput.itemOfItem(index: index)
    }

    func itemOfAddress(index: Int) -> String? {
        return useCaseInput.itemOfAddress(index: index)
    }
}
