@auth @regression
Feature: Auth API - Refresh Token

  Background:
    * url baseUrl
    * def loginResult = call read('classpath:reusable/auth/login.feature')
    * def currentRefreshToken = loginResult.refreshToken

  Scenario: Successfully refresh authentication token
    Given path '/auth/refresh'
    And request { refreshToken: '#(currentRefreshToken)', expiresInMins: 30 }
    When method post
    Then status 200
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    * def newAccessToken = response.accessToken
    * def newRefreshToken = response.refreshToken
