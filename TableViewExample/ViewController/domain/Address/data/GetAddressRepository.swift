protocol GetAddressRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct GetAddressRepository {
    let repositoryInput: GetAddressRepositoryInput
}

extension GetAddressRepository: GetAddressUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
