Feature: Update Employee Details

Background:
* def updateUrl = baseUrl + UPDATE_EMPLOYEE_ENDPOINT
* json update_emp_json = read('classpath:json/update-employee.json')

@smoke @update
Scenario: Verify update employee
Given url updateUrl + '/103714'
* print update_emp_json
And request update_emp_json
When method PUT
Then status 200
And assert response.name == 'Boy Who'
* assert response.name == 'Boy Who'


@update
Scenario Outline: Verify update employee with updated name
Given url updateUrl + '/<id>'
* set update_emp_json.name = '<name>'
* print update_emp_json
And request update_emp_json
When method PUT
Then status 200
And assert response.name == '<name>'
Examples:
|id     |name       |
|103757 |Updated Man|

