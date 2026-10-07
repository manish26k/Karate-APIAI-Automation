@user @regression
Feature: User API - Get Single User by ID

  Background:
    * url baseUrl
    * def userId = 1

  Scenario: Retrieve single user by ID successfully
    Given path '/users', userId
    When method get
    Then status 200
    And match response == '#object'
    And match response.id == userId
    And match response.firstName == '#string'
    And match response.lastName == '#string'
    And match response.username == '#string'
    And match response.email == '#string'
    * print 'User response:', response
