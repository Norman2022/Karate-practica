Feature: Clockify Time Entry

  Background: URl y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'OWVjYTc1MGItMmQ3Yi00ZmYwLTg0MDgtMWQ1MWE2MGIzNDZl'
    And header Content-Type = 'application/json'






#prueba con espera
  Scenario Outline: Crear time entry
    * def body = read('classpath:examples/users/request/rqAddTimeEntries.json')
    Given path 'workspaces','<workspaces>','time-entries'
    And request body
    When method POST
    * def sleep =
    """
    function(){
    java.lang.Thread.sleep(5000);
    }
    """
    * call sleep
    Then status 201
    * def id = response.id;
    Examples:

      | workspaces               |
      | 6284190cbf8ca01b7b85a380 |