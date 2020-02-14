protocol ViewControllerRepositoryInput {
    func numberOfSections() -> Int
    func itemsOfCustomer() -> [String]
    func itemsOfItem() -> [String]
    func itemsOfAddress() -> [String]
    func itemOfCustomer(index: Int) -> String
    func itemOfItem(index: Int) -> String
    func itemOfAddress(index: Int) -> String
}

struct ViewControllerRepository {
    let dataStore: ViewControllerRepositoryInput
}

extension ViewControllerRepository: ViewControllerUseCaseInput {
    func numberOfSections() -> Int {
        return dataStore.numberOfSections()
    }

    func itemsOfCustomer() -> [String] {
        return dataStore.itemsOfCustomer()
    }

    func itemsOfItem() -> [String] {
        return dataStore.itemsOfItem()
    }

    func itemsOfAddress() -> [String] {
        return dataStore.itemsOfAddress()
    }

    func itemOfCustomer(index: Int) -> String {
        return dataStore.itemOfCustomer(index: index)
    }

    func itemOfItem(index: Int) -> String {
        return dataStore.itemOfItem(index: index)
    }

    func itemOfAddress(index: Int) -> String {
        return dataStore.itemOfAddress(index: index)
    }
}
