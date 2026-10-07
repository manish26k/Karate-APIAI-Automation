Feature: Reusable Update User (PATCH)

  Scenario: Update user using provided userId and userData payload
    * url baseUrl
    * def id = (__arg && __arg.userId) ? __arg.userId : userId
    * def payload = (__arg && __arg.userData) ? __arg.userData : userData
    Given path '/users', id
    And request payload
    When method patch
    Then status 200
    * def updateResponse = response
