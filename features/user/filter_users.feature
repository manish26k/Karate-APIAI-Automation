@user @regression
Feature: User API - Filter Users

  Background:
    * url baseUrl
    * def filterKey = 'hair.color'
    * def filterValue = 'Brown'

  Scenario: Filter users successfully by hair color
    Given path '/users/filter'
    And param key = filterKey
    And param value = filterValue
    And param limit = 5
    And param select = 'id,firstName,lastName,hair'
    When method get
    Then status 200
    And match response.users == '#[]'
    And match response.users != '#[0]'
    And match response.total == '#number'
    And match response.skip == '#number'
    And match response.limit == '#number'
    And match each response.users == '#? _.hair && _.hair.color == filterValue'
    And match response.users[0] contains { id: '#number', firstName: '#string', lastName: '#string', hair: '#object' }
    * print 'Filter Key:', filterKey, 'Filter Value:', filterValue
    * print 'Filtered Users:', response.users
