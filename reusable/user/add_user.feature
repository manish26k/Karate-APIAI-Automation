Feature: Reusable Add User

  Scenario: Add user using provided userData payload
    * url baseUrl
    * def payload = (__arg && __arg.userData) ? __arg.userData : userData
    Given path '/users/add'
    And request payload
    When method post
    Then status 201
    * def addUserResponse = response
