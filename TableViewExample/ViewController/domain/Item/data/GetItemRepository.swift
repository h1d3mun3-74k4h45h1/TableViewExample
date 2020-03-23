protocol GetItemRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct GetItemRepository {
    let repositoryInput: GetItemRepositoryInput
}

extension GetItemRepository: GetItemUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
