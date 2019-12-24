Feature: Create Employee

@smoke @create
Scenario Outline: Verify create employee
Given url baseUrl + CREATE_EMPLOYEE_ENDPOINT
* def create_emp_json = Java.type('JsonUtils').readJson('create-update-employee.json')
* def updated_create_emp_json = Java.type('JsonUtils').updateJson(create_emp_json, '<key>', '<value>')
* print updated_create_emp_json
And request updated_create_emp_json
When method POST
Then status 200
And assert response.<key> == '<value>'
Examples:
|key|value|
|salary|999|
