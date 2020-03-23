struct GetItemDataStore {
    let value: String?
}

extension GetItemDataStore: GetItemRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return value
    }
}
