@user @regression
Feature: User API - Get All Users

  Background:
    * url baseUrl

  Scenario: Retrieve list of all users successfully
    Given path '/users'
    When method get
    Then status 200
    And match response.users == '#[]'
    And match response.users[0] == '#object'
    And match response.total == '#number'
    And match response.skip == '#number'
    And match response.limit == '#number'
    And match response.users[0] contains { id: '#number', firstName: '#string', lastName: '#string', username: '#string' }
