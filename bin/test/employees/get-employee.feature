Feature: Get Employee Details

Background:
* def getEmpUrl = baseUrl + GET_EMPLOYEE_ENDPOINT


@smoke @get @one
Scenario: Verify employee salary
Given url getEmpUrl + '/103714'
When method GET
Then status 200
And match $ contains {employee_salary:"123"}


@get
Scenario Outline: Verify employee details
Given url getEmpUrl + '/<employeeId>'
When method GET
Then status 200
And match $ contains <expected>
Examples:
|employeeId|expected|
|103714|{employee_salary:"123"}|
|103714|{employee_name:"Boy Who"}|


@get
Scenario Outline: Verify failure
Given url getEmpUrl + '/<employeeId>'
When method GET
Then status 201
And match $ contains <expected>
Examples:
|employeeId|expected|
|103714|{employee_salary:"123"}|
