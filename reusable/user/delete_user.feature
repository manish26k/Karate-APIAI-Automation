Feature: Reusable Delete User

  Scenario: Delete user using provided userId
    * url baseUrl
    * def id = (__arg && __arg.userId) ? __arg.userId : userId
    Given path '/users', id
    When method delete
    Then status 200
    * def deleteResponse = response
