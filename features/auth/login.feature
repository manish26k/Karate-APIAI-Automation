@auth @smoke
Feature: Auth API - Login

  Background:
    * url baseUrl
    * def env = karate.env || 'dev'
    * def loginData = read('classpath:test-data/auth/' + env + '/login.json')

  Scenario: Successful login with valid credentials
    Given path '/auth/login'
    And request loginData.validUser
    When method post
    Then status 201
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    * def accessToken = response.accessToken
    * def refreshToken = response.refreshToken
