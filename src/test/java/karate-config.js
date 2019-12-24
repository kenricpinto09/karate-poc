function fn() {

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    var baseUrl = karate.env;

    if (!baseUrl) {
        baseUrl = 'http://dummy.restapiexample.com';
    }

    karate.log('base url: ', baseUrl);

    var port = karate.properties['port'];
    karate.log('port: ', port);

    var config = {
        baseUrl: baseUrl,
        GET_EMPLOYEE_ENDPOINT: '/api/v1/employee',
        UPDATE_EMPLOYEE_ENDPOINT: '/api/v1/update',
        CREATE_EMPLOYEE_ENDPOINT: '/api/v1/create'
    };

    return config;
}
