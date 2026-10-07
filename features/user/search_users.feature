@user @regression
Feature: User API - Search Users

  Background:
    * url baseUrl
    * def searchTerm = 'John'

  Scenario: Search users by query term successfully
    Given path '/users/search'
    And param q = searchTerm
    When method get
    Then status 200
    And match response.users == '#[]'
    And match response.users != '#[0]'
    And match response.total == '#number'
    And match response.skip == '#number'
    And match response.limit == '#number'
    And match each response.users == '#? _.firstName.toLowerCase().includes(searchTerm.toLowerCase()) || _.lastName.toLowerCase().includes(searchTerm.toLowerCase())'
    And match response.users[0] contains { id: '#number', firstName: '#string', lastName: '#string', username: '#string', email: '#string' }
    * print 'Search Term:', searchTerm
    * print 'Response Users:', response.users
