protocol GetItemRepositoryInput {
    func execute() -> [String]
}

struct GetItemRepository {
    let repositoryInput: GetItemRepositoryInput
}

extension GetItemRepository: GetItemUseCaseInput {
    func execute() -> [String] {
        return repositoryInput.execute()
    }
}
