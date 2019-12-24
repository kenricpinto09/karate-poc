# Karate POC

This is a POC project that aims to familiarize the audience with the features of the Karate API framework

## Getting Started

This project uses the create, update and get endpoints from the [Dummy Employee REST API](http://dummy.restapiexample.com/).
Test scenarios are written in [Gherkin](https://cucumber.io/docs/gherkin/reference/) 
and are bundled into one or more feature files 

### Prerequisites

* Java 8
* Gradle

## Running the tests

Run the entire test suite
```
gradle test
or
gradle test -Dkarate.env="http://dummy.restapiexample.com"
```

Run a particular feature file
```
gradle test -Dkarate.options="classpath:employees/get-employee.feature"
```

Run a selected set of tagged scenarios
```
gradle test -Dkarate.options="--tags @update"
```


## References

* Intuit Karate on [GitHub](https://github.com/intuit/karate)