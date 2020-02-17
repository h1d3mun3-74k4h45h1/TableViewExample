struct ViewControllerDataStore {
    let model = TestModel(customerName: "Test Customer", itemName: "Waiwai", address: "Tokyo Tower")

}

extension ViewControllerDataStore: ViewControllerRepositoryInput {
    func numberOfSections() -> Int {
        return 3
    }

    func itemsOfCustomer() -> [String] {
        guard let value = model.customerName else { return [] }
        return [value]
    }

    func itemsOfItem() -> [String] {
        guard let value = model.itemName else { return [] }
        return [value]
    }

    func itemsOfAddress() -> [String] {
        guard let value = model.address else { return [] }
        return [value]
    }

    func itemOfCustomer(index: Int) -> String? {
        return model.customerName
    }

    func itemOfItem(index: Int) -> String? {
        return model.itemName
    }

    func itemOfAddress(index: Int) -> String? {
        return model.address
    }
}
