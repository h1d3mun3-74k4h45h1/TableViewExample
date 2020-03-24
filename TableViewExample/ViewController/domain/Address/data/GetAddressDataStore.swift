struct GetAddressDataStore {
    let value: String?
}

extension GetAddressDataStore: GetAddressRepositoryInput {
    func execute() -> [String] {
        guard let value = value else { return [] }
        return [value]
    }

}
