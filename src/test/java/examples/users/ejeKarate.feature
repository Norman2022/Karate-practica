Feature: Clockify academy

  Background: URl y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'OWVjYTc1MGItMmQ3Yi00ZmYwLTg0MDgtMWQ1MWE2MGIzNDZl'
    And header Content-Type = 'application/json'

  Scenario: Consultar proyecto por id
   # Given header X-Api-Key = 'OWVjYTc1MGItMmQ3Yi00ZmYwLTg0MDgtMWQ1MWE2MGIzNDZl'
   # And header Content-Type = 'application/json'
    And path 'workspaces','6284190cbf8ca01b7b85a380','projects','628455aebf8ca01b7b88297b'
    When method GET
    Then status 200
    And match response.name =='#string'



  Scenario Outline: Consultar proyecto por id
    #Given header X-Api-Key = 'OWVjYTc1MGItMmQ3Yi00ZmYwLTg0MDgtMWQ1MWE2MGIzNDZl'
    #And header Content-Type = 'application/json'
    And path 'workspaces','<workspaces>','projects','<project>'
    When method GET
    Then status 200
    And match response.name =='<nombreProyecto>'

    Examples:
      | workspaces               | project                  | nombreProyecto |  |
      | 6284190cbf8ca01b7b85a380 | 628455aebf8ca01b7b88297b | My API Project |  |



  Scenario Outline: Borrar time entry
    * def responseTimeEntry = call read('classpath:examples/users/createTimeEntry.feature')
    * def idTimeEntry = responseTimeEntry.id;
    Given path 'workspaces','<workspaces>','time-entries', idTimeEntry
    When method DELETE
    Then status 204

    Examples:
      | workspaces               |
      | 6284190cbf8ca01b7b85a380 |


  @ejerAcademy
  Scenario Outline: Editar time entry
   * def body = read('classpath:examples/users/request/rqEditTimeEntries.json')
   #* set body.description = "EntryEditado"    #otra forma de cambiar un campo
    * def responseTimeEntry = call read('classpath:examples/users/createTimeEntry.feature')
    * def idTimeEntry = responseTimeEntry.id;
    Given path 'workspaces','<workspaces>','time-entries', idTimeEntry
    And request body
    When method PUT
    Then status 200
    Examples:

      | workspaces               |
      | 6284190cbf8ca01b7b85a380 |