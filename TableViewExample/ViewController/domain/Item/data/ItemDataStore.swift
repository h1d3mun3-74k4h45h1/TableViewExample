struct ItemDataStore {
    let value: String?
}

extension ItemDataStore: ItemRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return value
    }
}
