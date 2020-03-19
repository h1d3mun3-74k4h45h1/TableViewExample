struct CustomerDataStore {
    let customerName: String?
}

extension CustomerDataStore: CustomerRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return customerName
    }
}
