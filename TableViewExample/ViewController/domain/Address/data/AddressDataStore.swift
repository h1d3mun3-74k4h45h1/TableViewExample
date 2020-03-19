struct AddressDataStore {
    let value: String?
}

extension AddressDataStore: AddressRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return value
    }
}
