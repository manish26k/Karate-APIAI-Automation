Feature: Reusable Auth Get Me

  Scenario: Get current authenticated user profile using provided access token
    * url baseUrl
    * def token = (__arg && __arg.accessToken) ? __arg.accessToken : accessToken
    Given path '/auth/me'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    * def meResponse = response
