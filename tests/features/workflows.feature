Feature: Workflows 
  As a user, I want to run various workflows with GeneFlow

  Scenario: Parameter strings with spaces are correctly passed to workflow step shell commands when running local workflows.
    Given The "local" "param-space" workflow has been installed
    When I run the "local" "param-space" workflow with a "string" parameter of "hello world"
    Then The "local" "param-space" workflow "print" step produces an output file called "output.txt" with contents "hello world"
  
  Scenario: Parameter strings with spaces are correctly passed to workflow step shell commands when running Agave workflows.
    Given The "agave" "param-space" workflow has been installed
    When I run the "agave" "param-space" workflow with a "string" parameter of "hello world"
    Then The "agave" "param-space" workflow "print" step produces an output file called "output.txt" with contents "hello world"

  Scenario: Apps with multi exec blocks are correctly executed locally.
    Given The "local" "multi-exec" workflow has been installed
    When I run the "local" "multi-exec" workflow with a "string" parameter of "hello world"
    Then The "local" "multi-exec" workflow "print" step produces an output file called "output.txt" with multi-line contents
        | line        |
        | hello world |
        | hello world |

  Scenario: Apps with multi exec blocks are correctly executed locally.
    Given The "agave" "multi-exec" workflow has been installed
    When I run the "agave" "multi-exec" workflow with a "string" parameter of "hello world"
    Then The "agave" "multi-exec" workflow "print" step produces an output file called "output.txt" with multi-line contents
        | line        |
        | hello world |
        | hello world |

  Scenario: Apps with if-else exec blocks are correctly executed locally.
    Given The "local" "if-else-exec" workflow has been installed
    When I run the "local" "if-else-exec" workflow with a "string" parameter of "hello world"
    Then The "local" "if-else-exec" workflow "print" step produces an output file called "output.txt" with contents "hello world else condition"

  Scenario: Apps with if-else exec blocks are correctly executed locally.
    Given The "agave" "if-else-exec" workflow has been installed
    When I run the "agave" "if-else-exec" workflow with a "string" parameter of "hello world"
    Then The "agave" "if-else-exec" workflow "print" step produces an output file called "output.txt" with contents "hello world else condition"
