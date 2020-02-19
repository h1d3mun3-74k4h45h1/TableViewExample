struct ViewControllerAddressDataStore {
    let value: String?
}

extension ViewControllerAddressDataStore: ViewControllerAddressRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return value
    }
}
