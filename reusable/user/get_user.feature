Feature: Reusable Get User by ID

  Scenario: Get user by ID using provided userId
    * url baseUrl
    * def id = (__arg && __arg.userId) ? __arg.userId : userId
    Given path '/users', id
    When method get
    Then status 200
    * def userResponse = response
