@user @regression
Feature: User API - Update User (PATCH)

  Background:
    * url baseUrl
    * def userId = 2
    * def updateData = read('classpath:test-data/user/update_user.json')

  Scenario: Update an existing user successfully via PATCH
    Given path '/users', userId
    And request updateData
    When method patch
    Then status 200
    And match response == '#object'
    And match response.id == userId
    And match response.lastName == updateData.lastName
    * print 'Request Data:', updateData
    * print 'Response Data:', response
