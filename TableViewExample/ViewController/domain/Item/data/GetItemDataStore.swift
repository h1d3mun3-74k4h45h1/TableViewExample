struct GetItemDataStore {
    let value: String?
}

extension GetItemDataStore: GetItemRepositoryInput {
    func execute() -> [String] {
        guard let value = value else { return [] }
        return [value]
    }
}
