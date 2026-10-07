Feature: Reusable Auth Refresh Token

  Scenario: Refresh authentication token using provided refresh token
    * url baseUrl
    * def token = (__arg && __arg.refreshToken) ? __arg.refreshToken : refreshToken
    Given path '/auth/refresh'
    And request { refreshToken: '#(token)', expiresInMins: 30 }
    When method post
    Then status 200
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    * def accessToken = response.accessToken
    * def refreshToken = response.refreshToken
