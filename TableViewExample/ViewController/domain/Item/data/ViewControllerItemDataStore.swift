struct ViewControllerItemDataStore {
    let value: String?
}

extension ViewControllerItemDataStore: ViewControllerItemRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return value
    }
}
