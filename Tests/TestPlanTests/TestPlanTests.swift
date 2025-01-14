import Testing
import Foundation
@testable import TestPlan

@Test func basicTestPlanDecodes() async throws {
    let json = """
    {
      "configurations" : [
        {
          "id" : "1234-1234-1234-1234",
          "name" : "Default Configuration",
          "options" : {

          }
        }
      ],
      "defaultOptions" : {
        "testExecutionOrdering" : "random"
      },
      "testTargets" : [
        {
          "target" : {
            "containerPath" : "container:Packages/SomePackage",
            "identifier" : "SomePackageTests",
            "name" : "SomePackageTests"
          }
        },
        {
          "isEnabled" : false,
          "parallelizable" : true,
          "selectedTests" : [
            "ToBeRun"
          ],
          "skippedTests" : [
            "ToBeSkipped"
          ],
          "target" : {
            "containerPath" : "container:Packages/AnotherPackage",
            "identifier" : "AnotherPackageTests",
            "name" : "AnotherPackageTests"
          }
        }
      ],
      "version" : 1
    }
    """

    _ = try JSONDecoder().decode(TestPlan.self, from: Data(json.utf8))
}
