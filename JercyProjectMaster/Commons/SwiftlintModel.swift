//
//  SwiftlintModel.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 04/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Foundation

struct LintModel {
    var checked: Bool
    let name: String
    let description: String
    let identifier: String
}

class LintModels {
    var items: [LintModel]
    
    func getCheckBox() -> (check: [String], uncheck: [String]) {
        var checkedItems: [String] = []
        var uncheckedItems: [String] = []
        items.forEach {
            if $0.checked {
                checkedItems.append($0.identifier)
            } else {
                uncheckedItems.append($0.identifier)
            }
        }
        
        return (checkedItems, uncheckedItems)
    }
    
    init() {
        items = [LintModel(checked: false, name: "AnyObject Protocol", description: "Prefer using AnyObject over class for class-only protocols.", identifier: "anyobject_protocol"),
                 LintModel(checked: false, name: "Array Init", description: "Prefer using Array(seq) than seq.map { $0 } to convert a sequence into an Array.", identifier: "array_init"),
                 LintModel(checked: false, name: "Attributes", description: "Attributes should be on their own lines in functions and types, but on the same line as variables and imports.", identifier: "attributes"),
                 LintModel(checked: true, name: "Block Based KVO", description: "Prefer the new block based KVO API with keypaths when using Swift 3.2 or later.", identifier: "block_based_kvo"),
                 LintModel(checked: true, name: "Class Delegate Protocol", description: "Delegate protocols should be class-only so they can be weakly referenced.", identifier: "class_delegate_protocol"),
                 LintModel(checked: true, name: "Closing Brace Spacing", description: "Closing brace with closing parenthesis should not have any whitespaces in the middle.", identifier: "closing_brace"),
                 LintModel(checked: false, name: "Closure Body Length", description: "Closure bodies should not span too many lines.", identifier: "closure_body_length"),
                 LintModel(checked: false, name: "Closure End Indentation", description: "Closure end should have the same indentation as the line that started it.", identifier: "closure_end_indentation"),
                 LintModel(checked: true, name: "Closure Parameter Position", description: "Closure parameters should be on the same line as opening brace.", identifier: "closure_parameter_position"),
                 LintModel(checked: false, name: "Closure Spacing", description: "Closure expressions should have a single space inside each brace.", identifier: "closure_spacing"),
                 LintModel(checked: false, name: "Collection Element Alignment", description: "All elements in a collection literal should be vertically aligned", identifier: "collection_alignment"),
                 LintModel(checked: true, name: "Colon", description: "Colons should be next to the identifier when specifying a type and next to the key in dictionary literals.", identifier: "colon"),
                 LintModel(checked: true, name: "Comma Spacing", description: "There should be no space before and one after any comma.", identifier: "comma"),
                 LintModel(checked: true, name: "Compiler Protocol Init", description: "The initializers declared in compiler protocols such as ExpressibleByArrayLiteral shouldn't be called directly.", identifier: "compiler_protocol_init"),
                 LintModel(checked: false, name: "Conditional Returns on Newline", description: "Conditional statements should always return on the next line.", identifier: "conditional_returns_on_newline"),
                 LintModel(checked: false, name: "Contains over first not nil", description: "Prefer contains over first(where:) != nil", identifier: "contains_over_first_not_nil"),
                 LintModel(checked: true, name: "Control Statement", description: "if,for,while,do,catch statements shouldn't wrap their conditionals or arguments in parentheses.", identifier: "control_statement"),
                 LintModel(checked: false, name: "Convenience Type", description: "Types used for hosting only static members should be implemented as a caseless enum to avoid instantiation.", identifier: "convenience_type"),
                 LintModel(checked: true, name: "Cyclomatic Complexity", description: "Complexity of function bodies should be limited.", identifier: "cyclomatic_complexity"),
                 LintModel(checked: true, name: "Discarded Notification Center Observer", description: "When registering for a notification using a block, the opaque observer that is returned should be stored so it can be removed later.", identifier: "discarded_notification_center_observer"),
                 LintModel(checked: true, name: "Discouraged Direct Initialization", description: "Discouraged direct initialization of types that can be harmful.", identifier: "discouraged_direct_init"),
                 LintModel(checked: false, name: "Discouraged Object Literal", description: "Prefer initializers over object literals.", identifier: "discouraged_object_literal"),
                 LintModel(checked: false, name: "Discouraged Optional Boolean", description: "Prefer non-optional booleans over optional booleans.", identifier: "discouraged_optional_boolean"),
                 LintModel(checked: false, name: "Discouraged Optional Collection", description: "Prefer empty collection over optional collection.", identifier: "discouraged_optional_collection"),
                 LintModel(checked: true, name: "Dynamic Inline", description: "Avoid using 'dynamic' and '@inline(__always)' together.", identifier: "dynamic_inline"),
                 LintModel(checked: false, name: "Empty Count", description: "Prefer checking isEmpty over comparing count to zero.", identifier: "empty_count"),
                 LintModel(checked: true, name: "Empty Enum Arguments", description: "Arguments can be omitted when matching enums with associated types if they are not used.", identifier: "empty_enum_arguments"),
                 LintModel(checked: true, name: "Empty Parameters", description: "Prefer () -> over Void ->.", identifier: "empty_parameters"),
                 LintModel(checked: true, name: "Empty Parentheses with Trailing Closure", description: "When using trailing closures, empty parentheses should be avoided after the method call.", identifier: "empty_parentheses_with_trailing_closure"),
                 LintModel(checked: false, name: "Empty String", description: "Prefer checking isEmpty over comparing string to an empty string literal.", identifier: "empty_string"),
                 LintModel(checked: false, name: "Empty XCTest Method", description: "Empty XCTest method should be avoided.", identifier: "empty_xctest_method"),
                 LintModel(checked: false, name: "Explicit ACL", description: "All declarations should specify Access Control Level keywords explicitly.", identifier: "explicit_acl"),
                 LintModel(checked: false, name: "Explicit Enum Raw Value", description: "Enums should be explicitly assigned their raw values.", identifier: "explicit_enum_raw_value"),
                 LintModel(checked: false, name: "Explicit Init", description: "Explicitly calling .init() should be avoided.", identifier: "explicit_init"),
                 LintModel(checked: false, name: "Explicit Top Level ACL", description: "Top-level declarations should specify Access Control Level keywords explicitly.", identifier: "explicit_top_level_acl"),
                 LintModel(checked: false, name: "Explicit Type Interface", description: "Properties should have a type interface", identifier: "explicit_type_interface"),
                 LintModel(checked: false, name: "Extension Access Modifier", description: "Prefer to use extension access modifiers", identifier: "extension_access_modifier"),
                 LintModel(checked: true, name: "Fallthrough", description: "Fallthrough should be avoided.", identifier: "fallthrough"),
                 LintModel(checked: false, name: "Fatal Error Message", description: "A fatalError call should have a message.", identifier: "fatal_error_message"),
                 LintModel(checked: false, name: "File Header", description: "Header comments should be consistent with project patterns.", identifier: "file_header"),
                 LintModel(checked: true, name: "File Line Length", description: "Files should not span too many lines.", identifier: "file_length"),
                 LintModel(checked: false, name: "File Name", description: "File name should match a type or extension declared in the file (if any).", identifier: "file_name"),
                 LintModel(checked: false, name: "First Where", description: "Prefer using .first(where:) over .filter { }.first in collections.", identifier: "first_where"),
                 LintModel(checked: true, name: "For Where", description: "where clauses are preferred over a single if inside a for.", identifier: "for_where"),
                 LintModel(checked: true, name: "Force Cast", description: "Force casts should be avoided.", identifier: "force_cast"),
                 LintModel(checked: true, name: "Force Try", description: "Force tries should be avoided.", identifier: "force_try"),
                 LintModel(checked: false, name: "Force Unwrapping", description: "Force unwrapping should be avoided.", identifier: "force_unwrapping"),
                 LintModel(checked: true, name: "Function Body Length", description: "Functions bodies should not span too many lines.", identifier: "function_body_length"),
                 LintModel(checked: false, name: "Function Default Parameter at End", description: "Prefer to locate parameters with defaults toward the end of the parameter list.", identifier: "function_default_parameter_at_end"),
                 LintModel(checked: false, name: "Function Parameter Count", description: "Number of function parameters should be low.", identifier: "function_parameter_count"),
                 LintModel(checked: true, name: "Generic Type Name", description: "Generic type name should only contain alphanumeric characters, start with an uppercase character and span between 1 and 20 characters in length.", identifier: "generic_type_name"),
                 LintModel(checked: false, name: "Identical Operands", description: "Comparing two identical operands is likely a mistake.", identifier: "identical_operands"),
                 LintModel(checked: true, name: "Identifier Name", description: "Identifier names should only contain alphanumeric characters and start with a lowercase character or should only contain capital letters. In an exception to the above, variable names may start with a capital letter when they are declared static and immutable. Variable names should not be too long or too short.", identifier: "identifier_name"),
                 LintModel(checked: true, name: "Implicit Getter", description: "Computed read-only properties should avoid using the get keyword.", identifier: "implicit_getter"),
                 LintModel(checked: false, name: "Implicit Return", description: "Prefer implicit returns in closures.", identifier: "implicit_return"),
                 LintModel(checked: false, name: "Implicitly Unwrapped Optional", description: "Implicitly unwrapped optionals should be avoided when possible.", identifier: "implicitly_unwrapped_optional"),
                 LintModel(checked: true, name: "Inert Defer", description: "If defer is at the end of its parent scope, it will be executed right where it is anyway.", identifier: "inert_defer"),
                 LintModel(checked: true, name: "Is Disjoint", description: "Prefer using Set.isDisjoint(with:) over Set.intersection(_:).isEmpty.", identifier: "is_disjoint"),
                 LintModel(checked: false, name: "Joined Default Parameter", description: "Discouraged explicit usage of the default separator.", identifier: "joined_default_parameter"),
                 LintModel(checked: true, name: "Large Tuple", description: "Tuples shouldn't have too many members. Create a custom type instead.", identifier: "large_tuple"),
                 LintModel(checked: true, name: "Leading Whitespace", description: "Files should not contain leading whitespace.", identifier: "leading_whitespace"),
                 LintModel(checked: true, name: "Legacy CGGeometry Functions", description: "Struct extension properties and methods are preferred over legacy functions", identifier: "legacy_cggeometry_functions"),
                 LintModel(checked: true, name: "Legacy Constant", description: "Struct-scoped constants are preferred over legacy global constants.", identifier: "legacy_constant"),
                 LintModel(checked: true, name: "Legacy Constructor", description: "Swift constructors are preferred over legacy convenience functions.", identifier: "legacy_constructor"),
                 LintModel(checked: true, name: "Legacy NSGeometry Functions", description: "Struct extension properties and methods are preferred over legacy functions", identifier: "legacy_nsgeometry_functions"),
                 LintModel(checked: false, name: "Legacy Random", description: "Prefer using type.random(in:) over legacy functions.", identifier: "legacy_random"),
                 LintModel(checked: false, name: "Variable Declaration Whitespace", description: "Let and var should be separated from other statements by a blank line.", identifier: "let_var_whitespace"),
                 LintModel(checked: true, name: "Line Length", description: "Lines should not span too many characters.", identifier: "line_length"),
                 LintModel(checked: false, name: "Literal Expression End Indentation", description: "Array and dictionary literal end should have the same indentation as the line that started it.", identifier: "literal_expression_end_indentation"),
                 LintModel(checked: false, name: "Lower ACL than parent", description: "Ensure definitions have a lower access control level than their enclosing parent", identifier: "lower_acl_than_parent"),
                 LintModel(checked: true, name: "Mark", description: "MARK comment should be in valid format. e.g. '// MARK: ...' or '// MARK: - ...'", identifier: "mark"),
                 LintModel(checked: false, name: "Missing Docs", description: "Declarations should be documented.", identifier: "missing_docs"),
                 LintModel(checked: false, name: "Modifier Order", description: "Modifier order should be consistent.", identifier: "modifier_order"),
                 LintModel(checked: false, name: "Multiline Arguments", description: "Arguments should be either on the same line, or one per line.", identifier: "multiline_arguments"),
                 LintModel(checked: false, name: "Multiline Function Chains", description: "Chained function calls should be either on the same line, or one per line.", identifier: "multiline_function_chains"),
                 LintModel(checked: false, name: "Multiline Parameters", description: "Functions and methods parameters should be either on the same line, or one per line.", identifier: "multiline_parameters"),
                 LintModel(checked: true, name: "Multiple Closures with Trailing Closure", description: "Trailing closure syntax should not be used when passing more than one closure argument.", identifier: "multiple_closures_with_trailing_closure"),
                 LintModel(checked: true, name: "Nesting", description: "Types should be nested at most 1 level deep, and statements should be nested at most 5 levels deep.", identifier: "nesting"),
                 LintModel(checked: false, name: "Nimble Operator", description: "Prefer Nimble operator overloads over free matcher functions.", identifier: "nimble_operator"),
                 LintModel(checked: false, name: "No Extension Access Modifier", description: "Prefer not to use extension access modifiers", identifier: "no_extension_access_modifier"),
                 LintModel(checked: true, name: "No Fallthrough Only", description: "Fallthroughs can only be used if the case contains at least one other statement.", identifier: "no_fallthrough_only"),
                 LintModel(checked: false, name: "No Grouping Extension", description: "Extensions shouldn't be used to group code within the same source file.", identifier: "no_grouping_extension"),
                 LintModel(checked: true, name: "Notification Center Detachment", description: "An object should only remove itself as an observer in deinit.", identifier: "notification_center_detachment"),
                 LintModel(checked: false, name: "Number Separator", description: "Underscores should be used as thousand separator in large decimal numbers.", identifier: "number_separator"),
                 LintModel(checked: false, name: "Object Literal", description: "Prefer object literals over image and color inits.", identifier: "object_literal"),
                 LintModel(checked: true, name: "Opening Brace Spacing", description: "Opening braces should be preceded by a single space and on the same line as the declaration.", identifier: "opening_brace"),
                 LintModel(checked: false, name: "Operator Usage Whitespace", description: "Operators should be surrounded by a single whitespace when they are being used.", identifier: "operator_usage_whitespace"),
                 LintModel(checked: true, name: "Operator Function Whitespace", description: "Operators should be surrounded by a single whitespace when defining them.", identifier: "operator_whitespace"),
                 LintModel(checked: false, name: "Overridden methods call super", description: "Some overridden methods should always call super", identifier: "overridden_super_call"),
                 LintModel(checked: false, name: "Override in Extension", description: "Extensions shouldn't override declarations.", identifier: "override_in_extension"),
                 LintModel(checked: false, name: "Pattern Matching Keywords", description: "Combine multiple pattern matching bindings by moving keywords out of tuples.", identifier: "pattern_matching_keywords"),
                 LintModel(checked: false, name: "Prefixed Top-Level Constant", description: "Top-level constants should be prefixed by k.", identifier: "prefixed_toplevel_constant"),
                 LintModel(checked: false, name: "Private Actions", description: "IBActions should be private.", identifier: "private_action"),
                 LintModel(checked: false, name: "Private Outlets", description: "IBOutlets should be private to avoid leaking UIKit to higher layers.", identifier: "private_outlet"),
                 LintModel(checked: true, name: "Private over fileprivate", description: "Prefer private over fileprivate declarations.", identifier: "private_over_fileprivate"),
                 LintModel(checked: true, name: "Private Unit Test", description: "Unit tests marked private are silently skipped.", identifier: "private_unit_test"),
                 LintModel(checked: false, name: "Prohibited Interface Builder", description: "Creating views using Interface Builder should be avoided.", identifier: "prohibited_interface_builder"),
                 LintModel(checked: false, name: "Prohibited calls to super", description: "Some methods should not call super", identifier: "prohibited_super_call"),
                 LintModel(checked: true, name: "Protocol Property Accessors Order", description: "When declaring properties in protocols, the order of accessors should be get set.", identifier: "protocol_property_accessors_order"),
                 LintModel(checked: false, name: "Quick Discouraged Call", description: "Discouraged call inside 'describe' and/or 'context' block.", identifier: "quick_discouraged_call"),
                 LintModel(checked: false, name: "Quick Discouraged Focused Test", description: "Discouraged focused test. Other tests won't run while this one is focused.", identifier: "quick_discouraged_focused_test"),
                 LintModel(checked: false, name: "Quick Discouraged Pending Test", description: "Pending test를 하지말라. 그렇지 않으면 pending되어있는동안 다른 test들이 동작하지 않을 것이다.", identifier: "quick_discouraged_pending_test"),
                 LintModel(checked: true, name: "Redundant Discardable Let", description: "Prefer _ = foo() over let _ = foo() when discarding a result from a function.", identifier: "redundant_discardable_let"),
                 LintModel(checked: false, name: "Redundant Nil Coalescing", description: "nil coalescing operator is only evaluated if the lhs is nil, coalescing operator with nil as rhs is redundant", identifier: "redundant_nil_coalescing"),
                 LintModel(checked: true, name: "Redundant Optional Initialization", description: "Initializing an optional variable with nil is redundant.", identifier: "redundant_optional_initialization"),
                 LintModel(checked: true, name: "Redundant Set Access Control Rule", description: "Property setter access level shouldn't be explicit if it's the same as the variable access level.", identifier: "redundant_set_access_control"),
                 LintModel(checked: true, name: "Redundant String Enum Value", description: "String enum values can be omitted when they are equal to the enumcase name.", identifier: "redundant_string_enum_value"),
                 LintModel(checked: false, name: "Redundant Type Annotation", description: "Variables should not have redundant type annotation", identifier: "redundant_type_annotation"),
                 LintModel(checked: true, name: "Redundant Void Return", description: "Returning Void in a function declaration is redundant.", identifier: "redundant_void_return"),
                 LintModel(checked: false, name: "Required Enum Case", description: "Enums conforming to a specified protocol must implement a specific case(s).", identifier: "required_enum_case"),
                 LintModel(checked: true, name: "Returning Whitespace", description: "Return arrow and return type should be separated by a single space or on a separate line.", identifier: "return_arrow_whitespace"),
                 LintModel(checked: true, name: "Shorthand Operator", description: "Prefer shorthand operators (+=, -=, *=, /=) over doing the operation and assigning.", identifier: "shorthand_operator"),
                 LintModel(checked: false, name: "Single Test Class", description: "Test files should contain a single QuickSpec or XCTestCase class.", identifier: "single_test_class"),
                 LintModel(checked: false, name: "Min or Max over Sorted First or Last", description: "Prefer using min() or max() over sorted().first or sorted().last", identifier: "sorted_first_last"),
                 LintModel(checked: false, name: "Sorted Imports", description: "Imports should be sorted.", identifier: "sorted_imports"),
                 LintModel(checked: true, name: "Statement Position", description: "Else and catch should be on the same line, one space after the previous declaration.", identifier: "statement_position"),
                 LintModel(checked: false, name: "Static Operator", description: "Operators should be declared as static functions, not free functions.", identifier: "static_operator"),
                 LintModel(checked: false, name: "Strict fileprivate", description: "fileprivate should be avoided.", identifier: "strict_fileprivate"),
                 LintModel(checked: true, name: "Superfluous Disable Command", description: "SwiftLint 'disable' commands are superfluous when the disabled rule would not have triggered a violation in the disabled region.", identifier: "superfluous_disable_command"),
                 LintModel(checked: true, name: "Switch and Case Statement Alignment", description: "Case statements should vertically align with the enclosing switch statement.", identifier: "switch_case_alignment"),
                 LintModel(checked: false, name: "Switch Case on Newline", description: "Cases inside a switch should always be on a newline", identifier: "switch_case_on_newline"),
                 LintModel(checked: true, name: "Syntactic Sugar", description: "Shorthand syntactic sugar should be used, i.e. [Int] instead of Array.", identifier: "syntactic_sugar"),
                 LintModel(checked: true, name: "Todo", description: "TODOs and FIXMEs should be resolved.", identifier: "todo"),
                 LintModel(checked: false, name: "Toggle Bool", description: "Prefer someBool.toggle() over someBool = !someBool.", identifier: "toggle_bool"),
                 LintModel(checked: false, name: "Trailing Closure", description: "Trailing closure syntax should be used whenever possible.", identifier: "trailing_closure"),
                 LintModel(checked: true, name: "Trailing Comma", description: "Trailing commas in arrays and dictionaries should be avoided/enforced.", identifier: "trailing_comma"),
                 LintModel(checked: true, name: "Trailing Newline", description: "Files should have a single trailing newline.", identifier: "trailing_newline"),
                 LintModel(checked: true, name: "Trailing Semicolon", description: "Lines should not have trailing semicolons.", identifier: "trailing_semicolon"),
                 LintModel(checked: true, name: "Trailing Whitespace", description: "Lines should not have trailing whitespace.", identifier: "trailing_whitespace"),
                 LintModel(checked: true, name: "Type Body Length", description: "Type bodies should not span too many lines.", identifier: "type_body_length"),
                 LintModel(checked: true, name: "Type Name", description: "Type name should only contain alphanumeric characters, start with an uppercase character and span between 3 and 40 characters in length.", identifier: "type_name"),
                 LintModel(checked: false, name: "Unavailable Function", description: "Unimplemented functions should be marked as unavailable.", identifier: "unavailable_function"),
                 LintModel(checked: true, name: "Unneeded Break in Switch", description: "Avoid using unneeded break statements.", identifier: "unneeded_break_in_switch"),
                 LintModel(checked: false, name: "Unneeded Parentheses in Closure Argument", description: "Parentheses are not needed when declaring closure arguments.", identifier: "unneeded_parentheses_in_closure_argument"),
                 LintModel(checked: false, name: "Untyped Error in Catch", description: "Catch statements should not declare error variables without type casting.", identifier: "untyped_error_in_catch"),
                 LintModel(checked: true, name: "Unused Closure Parameter", description: "Unused parameter in a closure should be replaced with _.", identifier: "unused_closure_parameter"),
                 LintModel(checked: false, name: "Unused Enumerated", description: "When the index or the item is not used, .enumerated() can be removed.", identifier: "unused_enumerated"),
                 LintModel(checked: false, name: "Unused Import", description: "All imported modules should be required to make the file compile.", identifier: "unused_import"),
                 LintModel(checked: true, name: "Unused Optional Binding", description: "Prefer != nil over let _ =", identifier: "unused_optional_binding"),
                 LintModel(checked: false, name: "Unused Private Declaration", description: "Private declarations should be referenced in that file.", identifier: "unused_private_declaration"),
                 LintModel(checked: true, name: "Valid IBInspectable", description: "@IBInspectable should be applied to variables only, have its type explicit and be of a supported type", identifier: "valid_ibinspectable"),
                 LintModel(checked: true, name: "Vertical Parameter Alignment", description: "Function parameters should be aligned vertically if they're in multiple lines in a declaration.", identifier: "vertical_parameter_alignment"),
                 LintModel(checked: false, name: "Vertical Parameter Alignment On Call", description: "Function parameters should be aligned vertically if they're in multiple lines in a method call.", identifier: "vertical_parameter_alignment_on_call"),
                 LintModel(checked: true, name: "Vertical Whitespace", description: "Limit vertical whitespace to a single empty line.", identifier: "vertical_whitespace"),
                 LintModel(checked: true, name: "Void Return", description: "Prefer -> Void over -> ().", identifier: "void_return"),
                 LintModel(checked: true, name: "Weak Delegate", description: "Delegates should be weak to avoid reference cycles.", identifier: "weak_delegate"),
                 LintModel(checked: true, name: "XCTFail Message", description: "An XCTFail call should include a description of the assertion.", identifier: "xctfail_message"),
                 LintModel(checked: false, name: "Yoda condition rule", description: "The variable should be placed on the left, the constant on the right of a comparison operator.", identifier: "yoda_condition")]
    }
}
