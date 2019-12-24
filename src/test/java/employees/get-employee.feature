Feature: Get Employee Details

Background:
* def getEmpUrl = baseUrl + GET_EMPLOYEE_ENDPOINT


@get
Scenario Outline: Verify employee details
Given url getEmpUrl + '/<employeeId>'
When method GET
Then status 200
And match $ contains <expected>
Examples:
|employeeId |expected               |
|228853     |{employee_salary:"999"}|
|228853     |{employee_age:"23"}    |


@get
Scenario Outline: Verify failure
Given url getEmpUrl + '/<employeeId>'
When method GET
Then status 201
And match $ contains <expected>
Examples:
|employeeId |expected               |
|228853     |{employee_salary:"123"}|
