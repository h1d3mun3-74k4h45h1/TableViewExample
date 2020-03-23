struct GetAddressDataStore {
    let value: String?
}

extension GetAddressDataStore: GetAddressRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return value
    }
}
