@auth @regression
Feature: Auth API - Get Current User (/auth/me)

  Background:
    * url baseUrl
    * def loginResult = call read('classpath:reusable/auth/login.feature')
    * def authToken = loginResult.accessToken

  Scenario: Get current authenticated user profile
    Given path '/auth/me'
    And header Authorization = 'Bearer ' + authToken
    When method get
    Then status 200
    And match response.id == '#number'
    And match response.username == '#string'
    And match response.email == '#string'
    And match response.firstName == '#string'
    And match response.lastName == '#string'
