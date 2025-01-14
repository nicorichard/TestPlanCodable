public struct TestPlan: Codable {
    public var configurations: [Configuration]
    public var defaultOptions: Options
    public var testTargets: [TestTarget]
    public var version: Int

    public struct Configuration: Codable {
        public var id: String
        public var name: String
        public var options: Options
    }

    public struct Options: Codable {
        public var testExecutionOrdering: String?
    }

    public struct TestTarget: Codable {
        public var skippedTests: [String]?
        public var target: Target

        /// empty ~= true
        public var isEnabled: Bool?

        /// empty ~= "Execute swift testing in parallel"
        /// true ~= Enabled (if possible)
        public var parallelizable: Bool?

        public var selectedTests: [String]?
    }

    public struct Target: Codable {
        public var containerPath: String
        public var identifier: String
        public var name: String
    }
}
