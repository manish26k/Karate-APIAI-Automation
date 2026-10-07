@user @regression
Feature: User API - Delete User

  Background:
    * url baseUrl
    * def userId = 1

  Scenario: Delete an existing user successfully
    Given path '/users', userId
    When method delete
    Then status 200
    And match response == '#object'
    And match response.id == userId
    And match response.isDeleted == true
    And match response.deletedOn == '#string'
    And match response.deletedOn != ''
    * print 'Deleted User ID:', userId
    * print 'Delete Response:', response
