import AEXML
import Foundation
import PathKit

extension XCScheme {
    // swiftlint:disable:next type_body_length
    public final class LaunchAction: SerialAction {
        public enum Style: String {
            case auto = "0"
            case wait = "1"
        }

        // MARK: - Static

        private static let defaultBuildConfiguration = "Debug"
        public static let defaultDebugServiceExtension = "internal"
        private static let defaultLaunchStyle = Style.auto

        // MARK: - Attributes

        public var buildableProductRunnable: BuildableProductRunnable?
        public var macroExpansion: BuildableReference?
        public var selectedDebuggerIdentifier: String
        public var selectedLauncherIdentifier: String
        public var buildConfiguration: String
        public var launchStyle: Style
        public var useCustomWorkingDirectory: Bool
        public var ignoresPersistentStateOnLaunch: Bool
        public var debugDocumentVersioning: Bool
        public var debugServiceExtension: String
        public var allowLocationSimulation: Bool
        public var locationScenarioReference: LocationScenarioReference?
        public var enableAddressSanitizer: Bool
        public var enableASanStackUseAfterReturn: Bool
        public var enableThreadSanitizer: Bool
        public var stopOnEveryThreadSanitizerIssue: Bool
        public var enableUBSanitizer: Bool
        public var stopOnEveryUBSanitizerIssue: Bool
        public var disableMainThreadChecker: Bool
        public var stopOnEveryMainThreadCheckerIssue: Bool
        public var additionalOptions: [AdditionalOption]
        public var commandlineArguments: CommandLineArguments?
        public var environmentVariables: [EnvironmentVariable]?
        public var language: String?
        public var region: String?
        public var launchAutomaticallySubstyle: String?

        // MARK: - Init

        public init(buildableProductRunnable: BuildableProductRunnable?,
                    buildConfiguration: String,
                    preActions: [ExecutionAction] = [],
                    postActions: [ExecutionAction] = [],
                    macroExpansion: BuildableReference? = nil,
                    selectedDebuggerIdentifier: String = XCScheme.defaultDebugger,
                    selectedLauncherIdentifier: String = XCScheme.defaultLauncher,
                    launchStyle: Style = .auto,
                    useCustomWorkingDirectory: Bool = false,
                    ignoresPersistentStateOnLaunch: Bool = false,
                    debugDocumentVersioning: Bool = true,
                    debugServiceExtension: String = LaunchAction.defaultDebugServiceExtension,
                    allowLocationSimulation: Bool = true,
                    locationScenarioReference: LocationScenarioReference? = nil,
                    enableAddressSanitizer: Bool = false,
                    enableASanStackUseAfterReturn: Bool = false,
                    enableThreadSanitizer: Bool = false,
                    stopOnEveryThreadSanitizerIssue: Bool = false,
                    enableUBSanitizer: Bool = false,
                    stopOnEveryUBSanitizerIssue: Bool = false,
                    disableMainThreadChecker: Bool = false,
                    stopOnEveryMainThreadCheckerIssue: Bool = false,
                    additionalOptions: [AdditionalOption] = [],
                    commandlineArguments: CommandLineArguments? = nil,
                    environmentVariables: [EnvironmentVariable]? = nil,
                    language: String? = nil,
                    region: String? = nil,
                    launchAutomaticallySubstyle: String? = nil) {
            self.buildableProductRunnable = buildableProductRunnable
            self.macroExpansion = macroExpansion
            self.buildConfiguration = buildConfiguration
            self.launchStyle = launchStyle
            self.selectedDebuggerIdentifier = selectedDebuggerIdentifier
            self.selectedLauncherIdentifier = selectedLauncherIdentifier
            self.useCustomWorkingDirectory = useCustomWorkingDirectory
            self.ignoresPersistentStateOnLaunch = ignoresPersistentStateOnLaunch
            self.debugDocumentVersioning = debugDocumentVersioning
            self.debugServiceExtension = debugServiceExtension
            self.allowLocationSimulation = allowLocationSimulation
            self.locationScenarioReference = locationScenarioReference
            self.enableAddressSanitizer = enableAddressSanitizer
            self.enableASanStackUseAfterReturn = enableASanStackUseAfterReturn
            self.enableThreadSanitizer = enableThreadSanitizer
            self.stopOnEveryThreadSanitizerIssue = stopOnEveryThreadSanitizerIssue
            self.enableUBSanitizer = enableUBSanitizer
            self.stopOnEveryUBSanitizerIssue = stopOnEveryUBSanitizerIssue
            self.disableMainThreadChecker = disableMainThreadChecker
            self.stopOnEveryMainThreadCheckerIssue = stopOnEveryMainThreadCheckerIssue
            self.additionalOptions = additionalOptions
            self.commandlineArguments = commandlineArguments
            self.environmentVariables = environmentVariables
            self.language = language
            self.region = region
            self.launchAutomaticallySubstyle = launchAutomaticallySubstyle
            super.init(preActions, postActions)
        }

        override init(element: AEXMLElement) throws {
            buildConfiguration = element.attributes["buildConfiguration"] ?? LaunchAction.defaultBuildConfiguration
            selectedDebuggerIdentifier = element.attributes["selectedDebuggerIdentifier"] ?? XCScheme.defaultDebugger
            selectedLauncherIdentifier = element.attributes["selectedLauncherIdentifier"] ?? XCScheme.defaultLauncher
            launchStyle = element.attributes["launchStyle"].flatMap { Style(rawValue: $0) } ?? .auto
            useCustomWorkingDirectory = element.attributes["useCustomWorkingDirectory"] == "YES"
            ignoresPersistentStateOnLaunch = element.attributes["ignoresPersistentStateOnLaunch"] == "YES"
            debugDocumentVersioning = element.attributes["debugDocumentVersioning"].map { $0 == "YES" } ?? true
            debugServiceExtension = element.attributes["debugServiceExtension"] ?? LaunchAction.defaultDebugServiceExtension
            allowLocationSimulation = element.attributes["allowLocationSimulation"].map { $0 == "YES" } ?? true

            let buildableProductRunnableElement = element["BuildableProductRunnable"]
            if buildableProductRunnableElement.error == nil {
                buildableProductRunnable = try BuildableProductRunnable(element: buildableProductRunnableElement)
            }
            let buildableReferenceElement = element["MacroExpansion"]["BuildableReference"]
            if buildableReferenceElement.error == nil {
                macroExpansion = try BuildableReference(element: buildableReferenceElement)
            }

            if element["LocationScenarioReference"].all?.first != nil {
                locationScenarioReference = try LocationScenarioReference(element: element["LocationScenarioReference"])
            } else {
                locationScenarioReference = nil
            }

            enableAddressSanitizer = element.attributes["enableAddressSanitizer"] == "YES"
            enableASanStackUseAfterReturn = element.attributes["enableASanStackUseAfterReturn"] == "YES"
            enableThreadSanitizer = element.attributes["enableThreadSanitizer"] == "YES"
            stopOnEveryThreadSanitizerIssue = element.attributes["stopOnEveryThreadSanitizerIssue"] == "YES"
            enableUBSanitizer = element.attributes["enableUBSanitizer"] == "YES"
            stopOnEveryUBSanitizerIssue = element.attributes["stopOnEveryUBSanitizerIssue"] == "YES"
            disableMainThreadChecker = element.attributes["disableMainThreadChecker"] == "YES"
            stopOnEveryMainThreadCheckerIssue = element.attributes["stopOnEveryMainThreadCheckerIssue"] == "YES"

            additionalOptions = try element["AdditionalOptions"]["AdditionalOption"]
                .all?
                .map(AdditionalOption.init) ?? []

            let commandlineOptions = element["CommandLineArguments"]
            if commandlineOptions.error == nil {
                commandlineArguments = try CommandLineArguments(element: commandlineOptions)
            }

            let environmentVariables = element["EnvironmentVariables"]
            if environmentVariables.error == nil {
                self.environmentVariables = try EnvironmentVariable.parseVariables(from: environmentVariables)
            }

            language = element.attributes["language"]
            region = element.attributes["region"]
            launchAutomaticallySubstyle = element.attributes["launchAutomaticallySubstyle"]
            try super.init(element: element)
        }

        // MARK: - XML

        private var xmlAttributes: [String: String] {
            var attributes = [
                "buildConfiguration": buildConfiguration,
                "selectedDebuggerIdentifier": selectedDebuggerIdentifier,
                "selectedLauncherIdentifier": selectedLauncherIdentifier,
                "launchStyle": launchStyle.rawValue,
                "useCustomWorkingDirectory": useCustomWorkingDirectory.xmlString,
                "ignoresPersistentStateOnLaunch": ignoresPersistentStateOnLaunch.xmlString,
                "debugDocumentVersioning": debugDocumentVersioning.xmlString,
                "debugServiceExtension": debugServiceExtension,
                "allowLocationSimulation": allowLocationSimulation.xmlString,
            ]

            if enableAddressSanitizer {
                attributes["enableAddressSanitizer"] = enableAddressSanitizer.xmlString
            }
            if enableASanStackUseAfterReturn {
                attributes["enableASanStackUseAfterReturn"] = enableASanStackUseAfterReturn.xmlString
            }
            if enableThreadSanitizer {
                attributes["enableThreadSanitizer"] = enableThreadSanitizer.xmlString
            }
            if stopOnEveryThreadSanitizerIssue {
                attributes["stopOnEveryThreadSanitizerIssue"] = stopOnEveryThreadSanitizerIssue.xmlString
            }
            if enableUBSanitizer {
                attributes["enableUBSanitizer"] = enableUBSanitizer.xmlString
            }
            if stopOnEveryUBSanitizerIssue {
                attributes["stopOnEveryUBSanitizerIssue"] = stopOnEveryUBSanitizerIssue.xmlString
            }
            if disableMainThreadChecker {
                attributes["disableMainThreadChecker"] = disableMainThreadChecker.xmlString
            }
            if stopOnEveryMainThreadCheckerIssue {
                attributes["stopOnEveryMainThreadCheckerIssue"] = stopOnEveryMainThreadCheckerIssue.xmlString
            }

            return attributes
        }

        func xmlElement() -> AEXMLElement {
            let element = AEXMLElement(name: "LaunchAction",
                                       value: nil,
                                       attributes: xmlAttributes)
            super.writeXML(parent: element)
            if let buildableProductRunnable = buildableProductRunnable {
                element.addChild(buildableProductRunnable.xmlElement())
            }

            if let locationScenarioReference = locationScenarioReference {
                element.addChild(locationScenarioReference.xmlElement())
            }

            if let macroExpansion = macroExpansion {
                let macro = element.addChild(name: "MacroExpansion")
                macro.addChild(macroExpansion.xmlElement())
            }

            if let commandlineArguments = commandlineArguments {
                element.addChild(commandlineArguments.xmlElement())
            }

            if let environmentVariables = environmentVariables {
                element.addChild(EnvironmentVariable.xmlElement(from: environmentVariables))
            }

            if let language = language {
                element.attributes["language"] = language
            }

            if let region = region {
                element.attributes["region"] = region
            }
            if let launchAutomaticallySubstyle = launchAutomaticallySubstyle {
                element.attributes["launchAutomaticallySubstyle"] = launchAutomaticallySubstyle
            }

            let additionalOptionsElement = element.addChild(AEXMLElement(name: "AdditionalOptions"))
            additionalOptions.forEach { additionalOption in
                additionalOptionsElement.addChild(additionalOption.xmlElement())
            }
            return element
        }

        // MARK: - Equatable

        override func isEqual(to: Any?) -> Bool {
            guard let rhs = to as? LaunchAction else { return false }
            return super.isEqual(to: to) &&
                buildableProductRunnable == rhs.buildableProductRunnable &&
                macroExpansion == rhs.macroExpansion &&
                selectedDebuggerIdentifier == rhs.selectedDebuggerIdentifier &&
                selectedLauncherIdentifier == rhs.selectedLauncherIdentifier &&
                buildConfiguration == rhs.buildConfiguration &&
                launchStyle == rhs.launchStyle &&
                useCustomWorkingDirectory == rhs.useCustomWorkingDirectory &&
                ignoresPersistentStateOnLaunch == rhs.ignoresPersistentStateOnLaunch &&
                debugDocumentVersioning == rhs.debugDocumentVersioning &&
                debugServiceExtension == rhs.debugServiceExtension &&
                allowLocationSimulation == rhs.allowLocationSimulation &&
                locationScenarioReference == rhs.locationScenarioReference &&
                enableAddressSanitizer == rhs.enableAddressSanitizer &&
                enableASanStackUseAfterReturn == rhs.enableASanStackUseAfterReturn &&
                enableThreadSanitizer == rhs.enableThreadSanitizer &&
                stopOnEveryThreadSanitizerIssue == rhs.stopOnEveryThreadSanitizerIssue &&
                enableUBSanitizer == rhs.enableUBSanitizer &&
                stopOnEveryUBSanitizerIssue == rhs.stopOnEveryUBSanitizerIssue &&
                disableMainThreadChecker == rhs.disableMainThreadChecker &&
                stopOnEveryMainThreadCheckerIssue == rhs.stopOnEveryMainThreadCheckerIssue &&
                additionalOptions == rhs.additionalOptions &&
                commandlineArguments == rhs.commandlineArguments &&
                environmentVariables == rhs.environmentVariables &&
                language == rhs.language &&
                region == rhs.region &&
                launchAutomaticallySubstyle == rhs.launchAutomaticallySubstyle
        }
    }
}
